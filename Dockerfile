FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html 404.html favicon.ico nodes.json 3rdpartylicenses.txt /usr/share/nginx/html/
COPY main.*.js runtime.*.js polyfills.*.js styles.*.css /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets

# COPY preserves source file modes; make everything world-readable for the nginx worker
RUN chmod -R a+rX /usr/share/nginx/html

EXPOSE 80
