# from /home/ubuntu/devops-build
cat > Dockerfile <<'EOF'
FROM nginx:alpine

# remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# copy the prepared static build files (must exist)
COPY build/ /usr/share/nginx/html/

# use our nginx config (optional - will use container default if absent)
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
EOF
