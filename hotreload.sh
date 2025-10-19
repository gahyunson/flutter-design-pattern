#!/bin/bash

DEVICE_ID="chrome"
TARGET="lib/main.dart"

echo "🚀 Watching for Dart file changes with entr..."

# 이미 flutter run 실행 중인지 확인
RUNNING_PID=$(pgrep -f "flutter_tools.*run.*-d $DEVICE_ID")

if [ -z "$RUNNING_PID" ]; then
    echo "⚙️  No Flutter run process found, starting new one..."
    fvm flutter run -d "$DEVICE_ID" --target="$TARGET" > flutter.log 2>&1 &
    FLUTTER_PID=$!
    echo "💡 Started flutter run with PID $FLUTTER_PID"
else
    FLUTTER_PID=$RUNNING_PID
    echo "✅ Found existing flutter run process (PID: $FLUTTER_PID)"
fi

cleanup() {
    echo "🛑 Stopping flutter process..."
    kill "$FLUTTER_PID" 2>/dev/null
    exit 0
}

trap cleanup SIGINT SIGTERM

# entr로 Dart 파일 변경 감시
find lib -name "*.dart" | entr -r sh -c "
    echo '🔄 File changed, triggering hot reload...'
    kill -USR1 $FLUTTER_PID 2>/dev/null && echo '✅ Hot reload signal sent' || echo '❌ Failed to send signal'
"
