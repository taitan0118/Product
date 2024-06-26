package poly.com.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPham {
	Integer MaSP;
	String TenSP;
	double Gia;
	double Sale;
	int SoLuong = 1;
	int Size;
	String Img;
}
