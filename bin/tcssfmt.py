import sys

MAX_BLANKS = 1


def format_tcss(text: str) -> str:
    indent = 0
    out = []
    blank_count = 0
    for line in text.splitlines():
        stripped = line.strip()

        # 1. Dedent BEFORE printing if the line starts with }
        if stripped.startswith("}"):
            indent = max(indent - 1, 0)

        # 2. Print the line with current indent
        if stripped:
            out.append("  " * indent + stripped)
            blank_count = 0
        elif blank_count < MAX_BLANKS:
            blank_count += 1
            out.append("")

        # 3. Increase indent AFTER printing if the line ends with {
        if stripped.endswith("{"):
            indent += 1

    return "\n".join(out)


if __name__ == "__main__":
    sys.stdout.write(format_tcss(sys.stdin.read()))
