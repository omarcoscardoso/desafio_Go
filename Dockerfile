FROM golang:1.18-alpine AS builder
WORKDIR /usr/src/app
COPY go.mod hello.go ./
RUN go build -o main hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /usr/src/app/main .
CMD ["/app/main"]


# WORKDIR /app
# COPY . .
# RUN go build -o main hello.go

# FROM scratch
# WORKDIR /app
# COPY --from=builder /app/main .

# CMD ["/app/main"]