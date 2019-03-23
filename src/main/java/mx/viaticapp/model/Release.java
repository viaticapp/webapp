package mx.viaticapp.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Fonseca
 */
@Entity
@Table(name = "base_connector")
public class Release implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = true)
    private Integer id;

    @Column(name = "filename", nullable = true)
    private String filename;

    @Column(name = "version", nullable = true)
    private Integer releaseVersion;

    @Column(name = "date", nullable = true)
    private Date releaseDate;

    @Column(name = "notes", nullable = true)
    private String releaseNotes;

    @Column(name = "download_path", nullable = true)
    private String downloadPath;

    @Column(name = "checksum", nullable = true)
    private String checksum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getReleaseVersion() {
        return releaseVersion;
    }

    public void setReleaseVersion(Integer releaseVersion) {
        this.releaseVersion = releaseVersion;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getReleaseNotes() {
        return releaseNotes;
    }

    public void setReleaseNotes(String releaseNotes) {
        this.releaseNotes = releaseNotes;
    }

    public String getDownloadPath() {
        return downloadPath;
    }

    public void setDownloadPath(String downloadPath) {
        this.downloadPath = downloadPath;
    }

    public String getChecksum() {
        return checksum;
    }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

}
