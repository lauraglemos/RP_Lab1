import sys

def convert_map_to_facts(input_file, output_file):

    try:
        with open(input_file, 'r') as f:
            lines = [line.strip() for line in f.readlines()]
    except FileNotFoundError:
        print(f"Error: The file “{input_file}” was not found.")
        sys.exit(1)

    if len(lines) < 3:
        print(f"Error: The input file “{input_file}” does not have the expected format (it needs at least 3 lines).")
        sys.exit(1)
    
    board_lines = lines[:-2]
    col_sum_line = lines[-2]
    row_sum_line  = lines[-1]


    symbol_map = {
        'L': 'L', 'R': 'R', 'U': 'U', 'D': 'D', 'v': 'd', '^':'u', '>': 'r', '<':'l'
    }


    head_symbols = ['R', 'L', 'U', 'D']

    # Calculate constants
    filled_cells = sum(int(x) for x in row_sum_line.split())
    therm_num = sum(line.count(sym) for line in board_lines for sym in head_symbols)
    n = len(board_lines)


    try:
        with open(output_file, 'w') as f_out:
            # Add constants
            f_out.write(f"#const n = {n}.\n")
            f_out.write(f"#const m = {filled_cells}.\n")
            f_out.write(f"#const k = {therm_num}.\n")

            # Add cells
            for i in range(1,n+1):
                for j in range(1,n+1):
                    f_out.write(f"cell({i},{j}).\n")

            # Add orientation fact
            f_out.write("orientation(R;U;L;D;r;u;l;d).\n")

            # Add thermometer facts
            for r, line in enumerate(board_lines, 1):
                for c, char in enumerate(line, 1):
                    direction = symbol_map.get(char)
                    if direction:
                        f_out.write(f'thermometer({r}, {c}, "{direction}").\n')

            # Add column and row facts
            col_sums = col_sum_line.split()
            for c, total in enumerate(col_sums, 1):
                f_out.write(f'col({c}, {total}).\n')

            row_sums = row_sum_line.split()
            for r, total in enumerate(row_sums, 1):
                f_out.write(f'row({r}, {total}).\n')

            
                
    except IOError:
        print(f"Error: Could not write to output file “{output_file}”.")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Use: python3 encode.py <input_file> <output_file>")
        print("Example: python3 encode.py dom01.txt domain.lp")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    convert_map_to_facts(input_file, output_file)
