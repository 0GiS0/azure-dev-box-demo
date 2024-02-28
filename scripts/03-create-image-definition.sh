echo -e "Creating image definition $VSCODE_IMAGE_DEFINITION in Azure Compute Gallery $GALLERY_NAME"

az sig image-definition create \
--resource-group $RESOURCE_GROUP \
--gallery-name $GALLERY_NAME \
--gallery-image-definition "$VSCODE_IMAGE_DEFINITION" \
--os-type "Windows" \
--os-state "Generalized" \
--publisher "returngis" \
--offer "vscodebox" \
--sku "1-0-0" \
--hyper-v-generation "V2" \
--features "SecurityType=TrustedLaunch"