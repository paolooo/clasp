FROM node:lts-alpine

ARG PORT=12390

WORKDIR /usr/src/app
EXPOSE $PORT

RUN npm install -g @google/clasp
RUN sed -i "s/s.listen(0/s.listen($PORT/" /usr/local/lib/node_modules/\@google/clasp/build/src/auth.js

ENTRYPOINT ["clasp"]
