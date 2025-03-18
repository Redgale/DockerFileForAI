# Use a smaller base image
FROM python:3.9-slim-buster AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/requirements.txt

# Install any needed dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Use a minimal image for the final stage
FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Expose the port the app will run on (adjust if needed)
EXPOSE 5000

# Command to run the app (adjust if needed)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
