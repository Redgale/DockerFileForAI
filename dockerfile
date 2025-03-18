# Use the FastChat image as the base
FROM ghcr.io/lm-sys/fastchat:latest

# Expose the port (7860 in this case)
EXPOSE 7860

# Set the default PORT environment variable (Koyeb sets its own, but this provides a fallback)
ENV PORT=7860

# Run FastChat, binding to all interfaces on the PORT
CMD ["fastchat", "serve", "--model-name", "alpaca-7b", "--device", "cpu", "--host", "0.0.0.0", "--port", "7860"]
