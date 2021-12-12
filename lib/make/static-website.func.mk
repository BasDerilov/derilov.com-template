# # usage: include it in your Makefile
# include lib/make/static-website-func.mk
#
# # function usage example:
#
# static-website-provisioning:
# 	$(call static-website-provisioning,dev,website)


define static-website-provisioning
  @echo ENV: $1
  @echo TGT_ORG: $2

  @echo "dev tst prd" | grep -w -q $1
  @echo "csitea mi-brio staslogistics" | grep -w -q $2

  ENV=$1 TGT_ORG=$2 ./run -a do_provision_030_create_static_website
  ENV=$1 TGT_ORG=$2 ./run -a do_provision_033_upload_static_website

  echo "Provided with success!"
endef


define static-website-divesting
  @echo ENV: $1
  @echo TGT_ORG: $2

  @echo "dev tst prd" | grep -w -q $1
  @echo "csitea mi-brio staslogistics" | grep -w -q $2

  ENV=$1 TGT_ORG=$2 ./run -a do_divest_190_delete_static_website

  echo "Divested with success!"
endef


define static-website-updating
  @echo ENV: $1
  @echo TGT_ORG: $2

  @echo "dev tst prd" | grep -w -q $1
  @echo "csitea mi-brio staslogistics" | grep -w -q $2

  ENV=$1 TGT_ORG=$2 ./run -a do_provision_033_upload_static_website

  echo "Website updated with success!"
endef
