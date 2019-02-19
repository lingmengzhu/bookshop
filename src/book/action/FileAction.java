package book.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.struts2.ServletActionContext;

public class FileAction {
	private File[] file;              
    private String[] fileFileName;    
    private String[] filePath;        
    private String downloadFilePath;  
    private InputStream inputStream; 
public String fileUpload() {
		String path = ServletActionContext.getServletContext().getRealPath("/attached");
		System.out.println("path:"+path);
		File file = new File(path); 
		if (!file.exists()) {
			file.mkdir();
		}
		try {
			if (this.file != null) {
				File f[] = this.getFile();
				filePath = new String[f.length];
				for (int i = 0; i < f.length; i++) {
					String fileName = java.util.UUID.randomUUID().toString(); // 閲囩敤鏃堕棿+UUID鐨勬柟寮忛殢鍗冲懡鍚�
					String name = fileName + fileFileName[i].substring(fileFileName[i].lastIndexOf("."));
					FileInputStream inputStream = new FileInputStream(f[i]);
					FileOutputStream outputStream = new FileOutputStream(path+ "\\" + name);
					byte[] buf = new byte[1024];
					int length = 0;
					while ((length = inputStream.read(buf)) != -1) {
						outputStream.write(buf, 0, length);
					}
					inputStream.close();
					outputStream.flush();
					filePath[i] = name;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	/**
	 * @return the file
	 */
	public File[] getFile() {
		return file;
	}
	/**
	 * @param file the file to set
	 */
	public void setFile(File[] file) {
		this.file = file;
	}
	/**
	 * @return the fileFileName
	 */
	public String[] getFileFileName() {
		return fileFileName;
	}
	/**
	 * @param fileFileName the fileFileName to set
	 */
	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}
	/**
	 * @return the filePath
	 */
	public String[] getFilePath() {
		return filePath;
	}
	/**
	 * @param filePath the filePath to set
	 */
	public void setFilePath(String[] filePath) {
		this.filePath = filePath;
	}
	/**
	 * @return the inputStream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}
	/**
	 * @param inputStream the inputStream to set
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	/**
	 * @return the downloadFilePath
	 */
	public String getDownloadFilePath() {
		return downloadFilePath;
	}
	/**
	 * @param downloadFilePath the downloadFilePath to set
	 */
	public void setDownloadFilePath(String downloadFilePath) {
		this.downloadFilePath = downloadFilePath;
	}
	
}