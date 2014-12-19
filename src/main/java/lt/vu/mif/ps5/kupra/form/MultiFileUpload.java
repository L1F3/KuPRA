package lt.vu.mif.ps5.kupra.form;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class MultiFileUpload {
    private List<MultipartFile> files;
    
    public List<MultipartFile> getFiles() {
        return files;
    }
 
    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }
}
