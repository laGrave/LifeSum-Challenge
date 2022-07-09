if which swiftgen >/dev/null; then
    swiftgen
else
    echo "error: SwiftGen does not exist, do \$ brew install swiftgen"
    exit 1
fi
