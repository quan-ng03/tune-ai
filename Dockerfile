# Use Flutter base image
FROM ghcr.io/cirruslabs/flutter:latest AS build

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get
# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the web release
RUN flutter build web

# Serve app using a lightweight web server (nginx)
FROM nginx:alpine

# Copy built web app to nginx's web folder
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

