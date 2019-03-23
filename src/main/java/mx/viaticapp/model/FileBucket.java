package mx.viaticapp.model;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Fonseca
 */
public class FileBucket {

    MultipartFile file;
    Integer version;
    String releaseNotes;
    String idInstallation;
    Integer idCfg;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getIdCfg() {
        return idCfg;
    }

    public void setIdCfg(Integer idCfg) {
        this.idCfg = idCfg;
    }

    public String getReleaseNotes() {
        return releaseNotes;
    }

    public void setReleaseNotes(String releaseNotes) {
        this.releaseNotes = releaseNotes;
    }

    public String getIdInstallation() {
        return idInstallation;
    }

    public void setIdInstallation(String idInstallation) {
        this.idInstallation = idInstallation;
    }

}
