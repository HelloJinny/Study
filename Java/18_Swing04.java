/*
 * 문제 1) Swing03의 결과 화면에서
 *      	 이미지 버튼을 클릭하면 "대한민국 버튼 클릭"이라는 메세지가
 *      	 버튼의 오른쪽에 표시되도록 이벤트를 적용하세요.
 *      	 또한 프레임의 제목을 "여기는 대한민국 입니다."라고 변경하세요.    
 */

package No18Swing;

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

// 0. 이벤트와 연관된 인터페이스를 사용하여 클래스 작성
class koreaImg extends JFrame implements ActionListener
{
	JLabel result;
	
	koreaImg()
	{
		// 1. 이미지 파일을 이용한 아이콘화
		ImageIcon korea = new ImageIcon("images/korea1.gif");
		// 상대 path
		// ./ : default위치에서 시작하겠다. 정학환 가독성을 위해서 붙이는게 좋다.
		
		// "버튼 이름"과 이미지 아이콘으로 버튼 객체 생성 (컴포넌트 객체 생성)
		// 2. 버튼에 아이콘 삽입
		JButton buttonKorea = new JButton("클릭", korea);
		result = new JLabel();
		
		// Frame 컨테이너 객체 생성
		Container container = getContentPane();  // 메소드를 통해서 컨테이너 객체를 가져온다.
		
		// 배치 관리자  // 기본 정렬은 Center // (수평, 수직)
		container.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 40));
		
		// 컨테이너에 컴포넌트 추가
		container.add(buttonKorea);
		container.add(result);
		
		// 3. 해당 객체에 리스너를 등록 // 이벤트 처리를 위한 버튼에 리스너 등록
		// 자기 자신을 가지고 이벤트를 등록한다. 이벤트에 대한 기능이 탑재되어야 하기 때문에
		buttonKorea.addActionListener(this);
		
		// 컨테이너 제목, 크기, 종료, 보이기
		setTitle("여기는 대한민국 입니다.");
		setSize(1000, 400);	
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e)
	{
		// 클릭한 버튼의 이름을 결과 레이블에 표시한다.
		result.setText(e.getActionCommand() +"\n");
		result.setText("대한민국 버튼 클릭");
	}
}

public class No18Swing04 {
	public static void main(String[] args) {
		new koreaImg();
	}
}

/*
 * [ 배치 관리자 - FlowLayout]
 * 
 * 1. 기본 정렬은 Center
 * 		container.setLayout(new FlowLayout());
 * 
 * 2. Left 정렬
 * 		container.setLayout(new FlowLayout(FlowLayout.LEFT));
 * 
 * 3. Left 정렬
 * 		container.setLayout(new FlowLayout(FlowLayout.RIGHT));
 * 
 * 4. Left 정렬 (정렬, 수평간격(픽셀수), 수직간격(픽셀수))
 * 		container.setLayout(new FlowLayout(FlowLayout.LEFT, 10, 50));
 */

/*
 * [ 배치 관리자 - BorderLayout : 홈페이지 레이아웃과 같은 구성]
 * 
 * container.add(new JButton("광고"), BorderLayout.EAST);
 * container.add(new JButton("메뉴"), BorderLayout.WEST);
 * container.add(new JButton("회사 기본 정보"), BorderLayout.SOUTH);
 * container.add(new JButton("타이틀"), BorderLayout.NORTH);
 * container.add(new JButton("내용"), BorderLayout.CENTER);
 */

/* [ 배치 관리자 - GridLayout ] */
