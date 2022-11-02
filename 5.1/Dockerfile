FROM nickblah/lua:5.1-luarocks
RUN apt-get update \
  && apt-get install build-essential curl libssl-dev -y \
  && luarocks install luacheck \
  && luarocks install luasec \
  && luarocks install luasocket
COPY ./run_test_chain.sh /bin/run_test_chain.sh
WORKDIR /cosock
RUN chmod +x /bin/run_test_chain.sh
CMD ["/bin/run_test_chain.sh"]
