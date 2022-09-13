function AddPostinstallToWIM($wimFile, $sourceFolder) {
    Log "INFO" "Adding postisntall $sourceFolder to $wimFile"
    Copy-Item -Path "$sourceFolder\*" -Destination "${wimFile}_mount\Windows\Setup" -Recurse

    if ($? -ne 0) {
        Log "INFO" "Successfully added updates from $sourceFolder to $wimFile"
        return $true;
    }

    Log "ERROR" "Failed to add updates from $sourceFolder to $wimFile"
    return $false;
}