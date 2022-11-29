FROM app_node as app_react

# WORKDIR /srv/app/reactapplication

COPY ./reactapplication /srv/app/

ENV PATH /app/node_modules/.bin:$PATH

EXPOSE 4000

CMD ["npm", "start"]