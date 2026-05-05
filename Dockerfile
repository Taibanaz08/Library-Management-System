
FROM nginx:alpine
 COPY lib/LibraryManagementSystem/web/ /usr/share/nginx/html/
EXPOSE 80