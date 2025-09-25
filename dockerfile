# Use Nginx as base image
FROM nginx:alpine

# Copy app files into nginx html folder
COPY app/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
