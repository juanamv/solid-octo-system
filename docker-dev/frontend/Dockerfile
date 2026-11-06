FROM node:18.20.8-bookworm-slim

COPY start.sh proxy.conf.json /usr/local/lib/sales/
RUN sed -i 's/\r$//' /usr/local/lib/sales/start.sh
WORKDIR /app
EXPOSE 4200
ENTRYPOINT ["sh", "/usr/local/lib/sales/start.sh"]
CMD ["npm", "start", "--", "--host", "0.0.0.0", "--poll", "1000", "--proxy-config", "/usr/local/lib/sales/proxy.conf.json"]
