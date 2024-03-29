IMAGE_REFERENCE_ID=$(az devcenter admin image show \
--resource-group $RESOURCE_GROUP \
--dev-center $DEV_CENTER_NAME \
--gallery-name $IMAGE_BUILDER_GALLERY_NAME \
--name  $VSCODE_IMAGE_DEFINITION \
--query id -o tsv)

time az devcenter admin devbox-definition create \
--name $DEV_BOX_FOR_CUSTOM_IMAGE_WITH_IMAGE_BUILDER \
--dev-center $DEV_CENTER_NAME \
--resource-group $RESOURCE_GROUP \
--image-reference id=$IMAGE_REFERENCE_ID \
--os-storage-type $STORAGE_TYPE \
--sku name="$SKU_NAME"