FROM node:18
WORKDIR /app
COPY custom-script.sh /app/
RUN chmod +x /app/custom-script.sh
CMD ["/app/custom-script.sh"]
