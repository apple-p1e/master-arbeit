function printMatrix(a)
% Display a cell type array as a matrix.

    col_width = max(cellfun(@numel, a)) + 4;
    col_width(1) = col_width(1) - 4;
    m = 1; n = sum(col_width);
    separator = sprintf('%s\n', repmat('=', m, n));
    row_template = [sprintf('%%%is', col_width) '\n'];
    printf(separator);
    printf(row_template, a'{:});
    printf(separator);
end