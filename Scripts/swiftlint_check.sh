export PATH="$PATH:/opt/homebrew/bin"
if which swiftlint >/dev/null; then
    swiftlint --no-cache --strict
else
    echo "error: SwiftLint does not exist, do \$ brew install swiftlint"
    exit 1
fi
