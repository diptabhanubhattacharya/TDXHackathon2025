public class FileUploadController {
    @AuraEnabled
    public static String uploadFile(FileUploaderBean fileData) {
        String filename = fileData.filename;
        String base64 = fileData.base64;
        String recordId = fileData.recordId;

        // Decode the base64 string to get the file data
        Blob fileBlob = Base64.decode(base64);

        // Create the ContentDocument
        ContentDocumentVersion cdv = new ContentDocumentVersion();
        cdv.ContentDocumentId = ContentDocumentId.valueOF(recordId);
        cdv.FileFolderId = recordId;
        cdv.FileName = filename;
        cdv.VersionData = fileBlob;
        cdv.ContentDocumentId = null;
        cdv.VersionNumber = 1;
        cdv.ContentType = ContentType.valueOF(filename.substring(filename.lastIndexOf('.')).toUpperCase());
        
        // Insert the ContentDocumentVersion
        try {
            insert cdv;
            return 'File uploaded successfully!';
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}