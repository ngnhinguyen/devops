#Erklärungen hier: https://medium.com/@anshita.bhasin/a-step-by-step-guide-to-create-dockerfile-9e3744d38d11

# Use a base image with Go
FROM golang:1.19-alpine AS builder

# Copy your Go code into the image
COPY . .

# Set the working directory
WORKDIR /app

# Build your Go application
RUN go mod download
RUN go build -o main

# FROM alpine:latest
# WORKDIR /app
# COPY --from=builder /app/main .
# CMD ["/app/main"]

# Use a smaller base image for production
FROM alpine:latest

# Copy the built executable from the builder stage
COPY --from=builder /app/main .

# Set the working directory
WORKDIR /app

# Run the executable
CMD ["/app/main"]
