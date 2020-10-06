/*
 * 문제 2) 5개의 과일 이미지(사과, 배, 감, 바나나, 포도)를 이용하여 이미지 버튼을 생성한 후,
 *			 3행2열 형태로 프레임에 배치한다. 
 *     		 또한 특정 이미지 버튼을 클릭하는 이벤트가 발생하면
 *			 3행 2열의 셀에 클릭한 버튼의 이름이 표시되도록 하세요.    
 */

package No18Swing;

import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

class FruitSelect extends JFrame implements ActionListener
{
	JLabel result;
	
	FruitSelect()
	{
		// 1. 이미지 파일을 이용한 아이콘화 (상대 경로 ./ : default 위치에서 시작하겠다. 정학환 가독성을 위해서 붙이는게 좋다.)
		ImageIcon apple = new ImageIcon("./images/apple.jpg");
		ImageIcon banana = new ImageIcon("./images/banana.jpg");
//		ImageIcon cherry = new ImageIcon("./images/cherry.jpg");	
		ImageIcon grape = new ImageIcon("./images/grape.jpg");
		ImageIcon pear = new ImageIcon("./images/pear.jpg");
		ImageIcon persimmon = new ImageIcon("./images/persimmon.jpg");
		
		// 2. 버튼에 아이콘 삽입 : "버튼 이름"과 이미지 아이콘으로 버튼 객체 생성 (컴포넌트 객체 생성)
		JButton buttonApple = new JButton("사과", apple);
		JButton buttonBanana = new JButton("바나나", banana);
//		JButton buttonCherry = new JButton("체리", cherry);
		JButton buttonGrape = new JButton("포도", grape);
		JButton buttonPear = new JButton("배", pear);
		JButton buttonPersimmon = new JButton("감", persimmon);
		result = new JLabel();
		
		// Frame 컨테이너 객체 생성
		Container container = getContentPane();  // 메소드를 통해서 컨테이너 객체를 가져온다.
		
		// 배치 관리자
		container.setLayout(new GridLayout(3, 2, 5, 5));
		
		// 컨테이너에 컴포넌트 추가
		container.add(buttonApple);
		container.add(buttonBanana);
//		container.add(buttonCherry);
		container.add(buttonGrape);
		container.add(buttonPear);
		container.add(buttonPersimmon);
		container.add(result);
		
		// 3. 해당 객체에 리스너를 등록 // 이벤트 처리를 위한 버튼에 리스너 등록
		// 자기 자신을 가지고 이벤트를 등록한다. 이벤트에 대한 기능이 탑재되어야 하기 때문에
		buttonApple.addActionListener(this);
		buttonBanana.addActionListener(this);
//		buttonCherry.addActionListener(this);
		buttonGrape.addActionListener(this);
		buttonPear.addActionListener(this);
		buttonPersimmon.addActionListener(this);
		
		// 컨테이너 제목, 크기, 종료, 보이기
		setTitle("과일 선택하기");
		setSize(200, 500);	
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e)
	{
		// 클릭한 버튼의 이름을 결과 레이블에 표시한다.
		result.setText(e.getActionCommand());	
	}
}

public class No18Swing09 {
	public static void main(String[] args) {
		new FruitSelect();
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
 * [ 배치 관리자 - BorderLayout(수평, 수직) : 홈페이지 레이아웃과 같은 구성]
 * 
 * container.add(new JButton("광고"), BorderLayout.EAST);
 * container.add(new JButton("메뉴"), BorderLayout.WEST);
 * container.add(new JButton("회사 기본 정보"), BorderLayout.SOUTH);
 * container.add(new JButton("타이틀"), BorderLayout.NORTH);
 * container.add(new JButton("내용"), BorderLayout.CENTER);
 */

/* [ 배치 관리자 - GridLayout(행, 열, 수평, 수직) ] */
