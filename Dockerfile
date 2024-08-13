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

# Expose the port your application listens on (if applicable)
#EXPOSE 8080 Cloud Run kümmert sich automatisch darum, 
#dass der Port 8080 für den eingehenden Traffic verfügbar ist. 

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
CMD ["/app/main"]
