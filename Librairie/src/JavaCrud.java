import java.awt.EventQueue;
import java.sql.*;
import java.sql.Connection;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;


import java.awt.Font;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;

import net.proteanit.sql.DbUtils;

import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;


public class JavaCrud {

	private JFrame frame;
	private JTextField textnomlivre;
	private JTextField textauteur;
	private JTextField textediteur;
	private JTextField textquantite;
	private JTextField textrayon;
	private JTextField textprix;
	private JTable table1;
	private JTextField textidsearch;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					JavaCrud window = new JavaCrud();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public JavaCrud() {
		initialize();
		Connect() ;
		chargement_table();
	}

	
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	
	
	
	public  void Connect() {
		
		try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
		con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-0VCC6KL;database=Librairie;integratedSecurity=true;");
		JOptionPane.showMessageDialog(null, "Connexion OK");	
		
	}	
	catch (ClassNotFoundException ex)	
	{
		ex.printStackTrace();
	}
	catch (SQLException ex)
	{
		
	
		
	
		
	}
	}
	public void chargement_table()
	{
		try
		{
		pst = con.prepareStatement("select * from Livre");
		rs = pst.executeQuery();
		table1.setModel (DbUtils.resultSetToTableModel (rs));
	}
	catch (SQLException e)
	{e.printStackTrace();

	}
}
	
	
	
	
	
	
	
	
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 1056, 884);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Anagramme");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 30));
		lblNewLabel.setBounds(401, 10, 219, 35);
		frame.getContentPane().add(lblNewLabel);
		
		JPanel panel = new JPanel();
		panel.setBorder(new TitledBorder(null, "Nouveau livre", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel.setBounds(10, 114, 443, 485);
		frame.getContentPane().add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel_2 = new JLabel("Nom livre");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_2.setBounds(27, 129, 101, 27);
		panel.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("Auteur");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_3.setBounds(27, 177, 77, 25);
		panel.add(lblNewLabel_3);
		
		JLabel lblNewLabel_4 = new JLabel("Editeur");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_4.setBounds(27, 219, 90, 34);
		panel.add(lblNewLabel_4);
		
		JLabel lblNewLabel_5 = new JLabel("Quantit\u00E9");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_5.setBounds(27, 263, 90, 38);
		panel.add(lblNewLabel_5);
		
		JLabel lblNewLabel_6 = new JLabel("Rayon");
		lblNewLabel_6.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_6.setBounds(27, 311, 90, 25);
		panel.add(lblNewLabel_6);
		
		textnomlivre = new JTextField();
		textnomlivre.setBounds(167, 135, 217, 19);
		panel.add(textnomlivre);
		textnomlivre.setColumns(10);
		
		textauteur = new JTextField();
		textauteur.setBounds(167, 182, 217, 19);
		panel.add(textauteur);
		textauteur.setColumns(10);
		
		textediteur = new JTextField();
		textediteur.setBounds(167, 229, 217, 19);
		panel.add(textediteur);
		textediteur.setColumns(10);
		
		textquantite = new JTextField();
		textquantite.setBounds(167, 275, 217, 19);
		panel.add(textquantite);
		textquantite.setColumns(10);
		
		textrayon = new JTextField();
		textrayon.setBounds(167, 316, 217, 19);
		panel.add(textrayon);
		textrayon.setColumns(10);
		
		JLabel lblNewLabel_6_1 = new JLabel("Prix");
		lblNewLabel_6_1.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_6_1.setBounds(27, 356, 90, 25);
		panel.add(lblNewLabel_6_1);
		
		textprix = new JTextField();
		textprix.setColumns(10);
		textprix.setBounds(167, 361, 217, 19);
		panel.add(textprix);
		
		textprix = new JTextField();
		textprix.setColumns(10);
		textprix.setBounds(167, 361, 217, 19);
		panel.add(textprix);
		
		JButton btnNewButton = new JButton("Sauvegarder");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String  Nom_Livre, Auteur, Editeur, Quantite, Rayon, Prix;
		
				
				Nom_Livre = textnomlivre.getText();
				Auteur = textauteur.getText();
				Editeur = textediteur.getText();
				Quantite = textquantite.getText();
				Rayon = textrayon.getText();
				Prix = textprix.getText();
				
				try {
					pst = con.prepareStatement("insert into Livre(Nom_Livre,Auteur,Editeur,Quantité,Rayon,Prix)values(?,?,?,?,?,?)");
					pst.setString(1, Nom_Livre);
					pst.setString(2, Auteur);
					pst.setString(3, Editeur);
					pst.setString(4, Quantite);
					pst.setString(5, Rayon);
					pst.setString(6, Prix);
					
					pst.executeUpdate();
					JOptionPane.showMessageDialog(null, "Enregistrement ajouté!");
					
					
					chargement_table();
					
					
					textnomlivre.setText("");
					textauteur.setText("");
					textediteur.setText("");
					textquantite.setText("");
					textrayon.setText("");
					textprix.setText("");
					textnomlivre.requestFocus();
				   }
			 
				catch (SQLException e1) 
			        {
									
				e1.printStackTrace();
				}
				
				
				
				
			}
		});
		btnNewButton.setBounds(10, 617, 121, 50);
		frame.getContentPane().add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("Retour");
		btnNewButton_1.setBounds(170, 617, 121, 50);
		frame.getContentPane().add(btnNewButton_1);
		
		JButton btnNewButton_2 = new JButton("Effacer");
		btnNewButton_2.setBounds(332, 617, 121, 50);
		frame.getContentPane().add(btnNewButton_2);
		
		JScrollPane Table1 = new JScrollPane();
		Table1.setBounds(483, 112, 549, 484);
		frame.getContentPane().add(Table1);
		
		table1 = new JTable();
		Table1.setViewportView(table1);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBorder(new TitledBorder(null, "Rechercher", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel_1.setBounds(10, 707, 443, 130);
		frame.getContentPane().add(panel_1);
		panel_1.setLayout(null);
		
		JLabel lblNewLabel_5_1 = new JLabel("Id livre");
		lblNewLabel_5_1.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_5_1.setBounds(29, 44, 90, 38);
		panel_1.add(lblNewLabel_5_1);
		
		
		
		textidsearch = new JTextField();
		textidsearch.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
			
				 try {
			          
			            String Id_Livre = textidsearch.getText();

			                pst = con.prepareStatement("select Nom_Livre,Auteur,Editeur,Quantité,Rayon,Prix from Livre where Id_Livre = ?");
			                pst.setString(1, Id_Livre);
			                ResultSet rs = pst.executeQuery();
			           
			            if(rs.next()==true)
			            {
			              
			                String Nom_Livre = rs.getString(1);
			                String Auteur = rs.getString(2);
			                String Editeur = rs.getString(3);
			                String Quantité = rs.getString(4);
			                String Rayon = rs.getString(5);
			                String Prix = rs.getString(6);
			                
			                textnomlivre.setText(Nom_Livre);
			                textauteur.setText(Auteur);
			                textediteur.setText(Editeur);
			                textquantite.setText(Quantité);
			                textrayon.setText(Rayon);
			                textprix.setText(Prix);
			                
			                
			            }   
			            else
			            {
			            	textnomlivre.setText("");
			            	textauteur.setText("");
			                textediteur.setText("");
			                textquantite.setText("");
			                textrayon.setText("");
			                textprix.setText("");
			                 
			            }
			            


			        } 
				
				 catch (SQLException ex) {
			           
			        }
				
				
				
				
			}
		
		
		
			
		});
		textidsearch.setColumns(10);
		textidsearch.setBounds(109, 56, 217, 19);
		panel_1.add(textidsearch);
		
		JButton btnNewButton_3 = new JButton("Modifier");
		btnNewButton_3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				

				String Nom_Livre, Auteur, Editeur, Quantite, Rayon, Prix,lid;
				
				
				Nom_Livre = textnomlivre.getText();
				Auteur = textauteur.getText();
				Editeur = textediteur.getText();
				Quantite = textquantite.getText();
				Rayon = textrayon.getText();
				Prix = textprix.getText();
				lid  = textidsearch.getText();
				
				 try {
						pst = con.prepareStatement("update Livre set Nom_Livre= ?,Auteur=?,Editeur=?,Quantité=?, Rayon=?, Prix=? where Id_Livre =?");
						pst.setString(1, Nom_Livre);
			            pst.setString(2, Auteur);
			            pst.setString(3, Editeur);
			            pst.setString(4, Quantite);
			            pst.setString(5, Rayon);
			            pst.setString(6, Prix);
			            pst.setString(7, lid);
			            pst.executeUpdate();
			            JOptionPane.showMessageDialog(null, "Modification enregistré!");
			            chargement_table();
			           
			            textnomlivre.setText("");
			            textauteur.setText("");
			            textediteur.setText("");
			            textquantite.setText("");
			            textrayon.setText("");
			            textprix.setText("");

			            textnomlivre.requestFocus();
					}
 
		            catch (SQLException e1) {
						
						e1.printStackTrace();
					}
	
			}
				
			
			
		});
		btnNewButton_3.setBounds(559, 617, 171, 50);
		frame.getContentPane().add(btnNewButton_3);
		
		JButton btnNewButton_3_1 = new JButton("Supprimer");
		btnNewButton_3_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				
				
				  String bid;
					bid  = textidsearch.getText();
					
					 try {
							pst = con.prepareStatement("delete from Livre where Id_Livre =?");
					
				            pst.setString(1, bid);
				            pst.executeUpdate();
				            JOptionPane.showMessageDialog(null, "Enregistrement supprimé!");
				            chargement_table();
				           
				            textnomlivre.setText("");
				            textauteur.setText("");
				            textediteur.setText("");
				            textquantite.setText("");
				            textrayon.setText("");
				            textprix.setText("");

				            textnomlivre.requestFocus();
						}
		 
			            catch (SQLException e1) {
							
							e1.printStackTrace();
						}
			}
		});
		btnNewButton_3_1.setBounds(787, 617, 171, 50);
		frame.getContentPane().add(btnNewButton_3_1);
	}
}
