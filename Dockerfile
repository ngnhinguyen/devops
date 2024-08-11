#Erklärungen hier: https://medium.com/@anshita.bhasin/a-step-by-step-guide-to-create-dockerfile-9e3744d38d11

# Use a base image with Go
FROM golang:1.19-alpine

# Copy your Go code into the image
COPY . /app

# Set the working directory
WORKDIR /app

# Build your Go application
RUN go build -o main

# Expose the port your application listens on (if applicable)
EXPOSE 8080

# Define the command to run when the container starts
CMD ["/app/main"]
