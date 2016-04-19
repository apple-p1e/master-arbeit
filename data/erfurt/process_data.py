import csv
import pickle


class OutOfDataError(Exception):
    def __init__(self, message):
        self.message = message
    def __repr__(self):
        return self.message


class DataProcessor(object):
    LOW_SIGNAL = 'Already in the beginning of the signal list!'
    LOW_CLASS = 'Already in the beginning of the class list!'
    OUT_OF_SIGNAL = 'Out of signal data!'
    OUT_OF_CLASS = 'Out of class data!'
    EMPTY_RESULT = 'The result list is empty!'

    def __init__(self, signals, classes):
        self._signal_idx = 0
        self._class_idx = 0
        self._result = []
        self._signals = signals
        self._classes = classes

    @property
    def result(self):
        return self._result

    @property
    def signal_idx(self):
        return self._signal_idx

    @property
    def class_idx(self):
        return self._class_idx
    
    @property
    def cur_signal(self):
        return self._signals[self._signal_idx]

    @property
    def cur_class(self):
        return self._classes[self._class_idx]
    

    def next_signal(self):
        self._signal_idx += 1
        if self._signal_idx >= len(self._signals):
            raise OutOfDataError(self.OUT_OF_SIGNAL)

    def prev_signal(self):
        self._signal_idx -= 1
        if self._signal_idx < 0:
            self._signal_idx = 0
            raise OutOfDataError(self.LOW_SIGNAL)

    def next_class(self):
        self._class_idx += 1
        if self._class_idx >= len(self._classes):
            raise OutOfDataError(self.OUT_OF_CLASS)

    def prev_class(self):
        self._class_idx -= 1
        if self._class_idx < 0:
            self._class_idx = 0
            raise OutOfDataError(self.LOW_CLASS)

    def add_data(self):
        self._result.append({
            'class': self._classes[self._class_idx][1],
            'signal': self._signals[self._signal_idx][1],
            'class_time': self._classes[self._class_idx][0],
            'signal_time': self._signals[self._signal_idx][0]
        })

    def remove_data(self):
        if self._result:
            return self._result.pop()
        else:
            raise OutOfDataError(self.EMPTY_RESULT)

    def save(self, path):
        with open(path, 'wb') as f:
            pickle.dump(self, f)

    def load(path):
        with open(path, 'rb') as f:
            obj = pickle.load(f)
        return obj

def _read_data(filename, signal):
    res = []
    with open(filename, 'r') as f:
        t = csv.reader(f, delimiter=';')
        l = [row for row in t]
        l = l[1:]
        if not signal:
            get_time = lambda x: x[0].split()[-1]
            idx = 5
        else:
            get_time = lambda x: x[0].split('.')[0]
            idx = 2
        for row in l:
            timestr = get_time(row)
            res.append([timestr, row[idx]])
    return res


class bcolors:
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'

    @classmethod
    def red(cls, s):
        return cls.RED + s + cls.ENDC

    @classmethod
    def yellow(cls, s):
        return cls.YELLOW + s + cls.ENDC

    @classmethod
    def cyan(cls, s):
        return cls.CYAN + s + cls.ENDC

    @classmethod
    def green(cls, s):
        return cls.GREEN + s + cls.ENDC


def _time_to_seconds(time):
    OFFSET = 50000
    SMH = [3600,60,1]
    return sum([a*b for a,b in zip(SMH, map(int,time.split(':')))])-OFFSET


def _current(i, time_i, j, time_j):
    return bcolors.cyan('Signal') + '[' + bcolors.cyan('%d' % i) + \
        ']: %d [%s] |  ' % (_time_to_seconds(time_i), time_i) + \
        bcolors.cyan('Class') + '[' + bcolors.cyan('%d' % j) + \
        ']: %d [%s]' % (_time_to_seconds(time_j), time_j)


def _added(i):
    return 'Data with class ' + bcolors.green('%s' % i)  + ' was ' + \
        bcolors.green('added') + '.'


def _removed(i):
    return 'Data with class ' + bcolors.red('%s' % i) + ' was ' + \
        bcolors.red('removed') + '.'

def _saved(path):
    return 'Data processor was saved in ' + bcolors.yellow(path) + '.'


def main(loadpath=None):

    # constants/messages
    COMMANDS = ['fc', 'bc', 'fs', 'bs', 'add', 'remove', 'break', 'save']
    INPUT = 'Input command: '
    FILENAME = 'Input filename: '
    REMINDER = '''
===========================================
Available commands:
[fc]: forward class;  [fs]: forward signal
[bc]: backward class; [bs]: backward signal
[add]: approve matching and add a data
[remove]: remove last added data
[break]: leave this business
==========================================='''
    
    # getting data and initializing data processor
    signal_data = _read_data('TSV813_Det2b.csv', signal=True)
    class_data = _read_data('vovaLogs.csv', signal=False)
    if loadpath:
        try:
            data_processor = DataProcessor.load(loadpath)
        except FileNotFoundError as e:
            print('No such file or directory: \'%s\'' % loadpath)
            return
    else:
        data_processor = DataProcessor(signal_data, class_data)

    # main process
    while True:
        print(_current(
            data_processor.signal_idx, data_processor.cur_signal[0],
            data_processor.class_idx, data_processor.cur_class[0]))
        command = input(INPUT)
        while command not in COMMANDS:
            print(REMINDER)
            command = input(INPUT)
        if command == 'fs':
            try:
                data_processor.next_signal()
            except OutOfDataError as e:
                print(e)
                break
        elif command == 'bs':
            try:
                data_processor.prev_signal()
            except OutOfDataError as e:
                print(e)
        elif command == 'fc':
            try:
                data_processor.next_class()
            except OutOfDataError as e:
                print(e)
                break
        elif command == 'bc':
            try:
                data_processor.prev_class()
            except OutOfDataError as e:
                print(e)
        elif command == 'add':
            data_processor.add_data()
            print(_added(data_processor.result[-1]['class']))
            try:
                data_processor.next_signal()
            except OutOfDataError as e:
                print(e)
                break
            try:
                data_processor.next_class()
            except OutOfDataError as e:
                print(e)
                break
        elif command == 'remove':
            try:
                removed = data_processor.remove_data()
                print(_removed(removed['class']))
            except OutOfDataError as e:
                print(e)
        elif command == 'save':
            filename = input(FILENAME)
            data_processor.save(filename)
            print(_saved(filename))
            return
        else:
            break
    return data_processor

if __name__ == '__main__':
    res = main()