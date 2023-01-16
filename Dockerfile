FROM nginx
RUN echo "default page" > /usr/share/nginx/html/index.html
VOLUME /usr/share/nginx/html/

ARG BUILD_TAG