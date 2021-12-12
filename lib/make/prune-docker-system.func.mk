.PHONY: do-prune-docker-system ## @-> stop & completely wipe out all the docker caches for ALL IMAGES !!!
do-prune-docker-system:
	@clear
	-docker kill $$(docker ps -q)
	-docker rm $$(docker ps -aq)
	docker image prune -a -f
	docker builder prune -f -a
	docker system prune --volumes -f

.PHONY: zip_me ## @-> an util to zip the whole project without the .git dir
zip_me:
	@clear
	-rm -v ../$(PRODUCT).zip ; zip -r ../$(PRODUCT).zip  . -x '*.git*'
