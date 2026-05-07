FROM nginx:alphine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# copy pre-built files
COPY build/usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
