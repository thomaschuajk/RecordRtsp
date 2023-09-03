#!/bin/bash

# RTSP URL of the stream
RTSP_URL="rtsp://example.com:554/stream"

# Output directory for saving the MP4 files
OUTPUT_DIR="/path/to/output_directory"

# File prefix for the recorded MP4 files
FILE_PREFIX="stream_record"

# Duration of each recording (in seconds)
DURATION=600  # 10 minutes

# Loop to continuously record the stream
while true
do
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    OUTPUT_FILE="$OUTPUT_DIR/$FILE_PREFIX_$TIMESTAMP.mp4"

    # Use FFmpeg to record the stream for the specified duration
    ffmpeg -rtsp_transport tcp -i "$RTSP_URL" -c:v copy -f segment -segment_time 600 -segment_format mp4 "$OUTPUT_FILE"

done
