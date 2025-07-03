FROM python:3.10-slim

# Install required system packages
RUN apt-get update && apt-get install -y \
    git ffmpeg curl wget gcc pkg-config \
    libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libavfilter-dev \
    libmagic-dev python3-dev build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "main.py"]
