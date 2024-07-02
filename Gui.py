import sys
from PyQt5.QtWidgets import (QApplication, QWidget, QVBoxLayout, QPushButton, QTextEdit, QMessageBox, QHBoxLayout, QGroupBox, QTableWidget, QTableWidgetItem, QTabWidget, QComboBox)
from PyQt5.QtGui import QFont, QIcon
import mysql.connector

class SQLRunner(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('SQL Runner')
        self.setGeometry(300, 300, 800, 600)
        
        # Uygulama logosunu ayarlayın
        self.setWindowIcon(QIcon('logo.png'))
        
        mainLayout = QVBoxLayout()
        
        # User Selection
        self.userSelection = QComboBox(self)
        self.userSelection.addItems(["root"])
        mainLayout.addWidget(self.userSelection)
        
        # Tab Widget
        self.tabs = QTabWidget()
        
        # Add tabs
        self.tabs.addTab(self.createQueryTab(), "SQL Sorgusu")
        self.tabs.addTab(self.createTriggerTab(), "Trigger Ekleme")
        self.tabs.addTab(self.createViewTab(), "View Ekleme")
        self.tabs.addTab(self.createTransactionTab(), "Transaction Ekleme")
        
        mainLayout.addWidget(self.tabs)
        
        self.setLayout(mainLayout)

    def createQueryTab(self):
        tab = QWidget()
        layout = QVBoxLayout()
        
        # SQL Query Group
        queryGroupBox = QGroupBox("SQL Sorgusu")
        queryLayout = QVBoxLayout()
        
        self.queryInput = QTextEdit(self)
        self.queryInput.setFont(QFont("Courier", 10))
        self.queryInput.setPlaceholderText('SQL sorgunuzu buraya girin')
        
        queryLayout.addWidget(self.queryInput)
        queryGroupBox.setLayout(queryLayout)
        
        # Buttons
        buttonLayout = QHBoxLayout()
        
        self.runBtn = QPushButton('SQL Sorgusunu Çalıştır', self)
        self.runBtn.clicked.connect(self.runSQL)
        buttonLayout.addWidget(self.runBtn)
        
        self.clearBtn = QPushButton('Temizle', self)
        self.clearBtn.clicked.connect(self.clearResults)
        buttonLayout.addWidget(self.clearBtn)
        
        # Results Group
        resultsGroupBox = QGroupBox("Sonuçlar")
        resultsLayout = QVBoxLayout()
        
        self.resultsTable = QTableWidget(self)
        self.resultsTable.setMinimumHeight(400)
        resultsLayout.addWidget(self.resultsTable)
        
        resultsGroupBox.setLayout(resultsLayout)
        
        # Add to tab layout
        layout.addWidget(queryGroupBox)
        layout.addLayout(buttonLayout)
        layout.addWidget(resultsGroupBox)
        
        tab.setLayout(layout)
        return tab

    def createTriggerTab(self):
        tab = QWidget()
        layout = QVBoxLayout()
        
        # Trigger Query Group
        triggerGroupBox = QGroupBox("Trigger Ekleme")
        triggerLayout = QVBoxLayout()
        
        self.triggerInput = QTextEdit(self)
        self.triggerInput.setFont(QFont("Courier", 10))
        self.triggerInput.setPlaceholderText('Trigger sorgunuzu buraya girin')
        
        triggerLayout.addWidget(self.triggerInput)
        triggerGroupBox.setLayout(triggerLayout)
        
        # Buttons
        buttonLayout = QHBoxLayout()
        
        self.runTriggerBtn = QPushButton('Trigger Ekle', self)
        self.runTriggerBtn.clicked.connect(self.runTrigger)
        buttonLayout.addWidget(self.runTriggerBtn)
        
        self.clearTriggerBtn = QPushButton('Temizle', self)
        self.clearTriggerBtn.clicked.connect(self.clearTriggerResults)
        buttonLayout.addWidget(self.clearTriggerBtn)
        
        # Add to tab layout
        layout.addWidget(triggerGroupBox)
        layout.addLayout(buttonLayout)
        
        tab.setLayout(layout)
        return tab

    def createViewTab(self):
        tab = QWidget()
        layout = QVBoxLayout()

        # View Query Group
        viewGroupBox = QGroupBox("View Ekleme")
        viewLayout = QVBoxLayout()

        self.viewInput = QTextEdit(self)
        self.viewInput.setFont(QFont("Courier", 10))
        self.viewInput.setPlaceholderText('View sorgunuzu buraya girin')

        viewLayout.addWidget(self.viewInput)
        viewGroupBox.setLayout(viewLayout)

        # Buttons
        buttonLayout = QHBoxLayout()

        self.runViewBtn = QPushButton('View Ekle', self)
        self.runViewBtn.clicked.connect(self.runView)
        buttonLayout.addWidget(self.runViewBtn)

        self.clearViewBtn = QPushButton('Temizle', self)
        self.clearViewBtn.clicked.connect(self.clearViewResults)
        buttonLayout.addWidget(self.clearViewBtn)

        # Add to tab layout
        layout.addWidget(viewGroupBox)
        layout.addLayout(buttonLayout)

        tab.setLayout(layout)
        return tab

    def createTransactionTab(self):
        tab = QWidget()
        layout = QVBoxLayout()
        
        # Transaction Query Group
        transactionGroupBox = QGroupBox("Transaction Ekleme")
        transactionLayout = QVBoxLayout()
        
        self.transactionInput = QTextEdit(self)
        self.transactionInput.setFont(QFont("Courier", 10))
        self.transactionInput.setPlaceholderText('Transaction sorgunuzu buraya girin')
        
        transactionLayout.addWidget(self.transactionInput)
        transactionGroupBox.setLayout(transactionLayout)
        
        # Buttons
        buttonLayout = QHBoxLayout()
        
        self.runTransactionBtn = QPushButton('Transaction Ekle', self)
        self.runTransactionBtn.clicked.connect(self.runTransaction)
        buttonLayout.addWidget(self.runTransactionBtn)
        
        self.clearTransactionBtn = QPushButton('Temizle', self)
        self.clearTransactionBtn.clicked.connect(self.clearTransactionResults)
        buttonLayout.addWidget(self.clearTransactionBtn)
        
        # Add to tab layout
        layout.addWidget(transactionGroupBox)
        layout.addLayout(buttonLayout)
        
        tab.setLayout(layout)
        return tab

    def runSQL(self):
        query = self.queryInput.toPlainText()
        self.executeQuery(query, self.resultsTable)

    def runTrigger(self):
        query = self.triggerInput.toPlainText()
        self.executeQuery(query, None)

    def runView(self):
        query = self.viewInput.toPlainText()
        self.executeQuery(query, None)

    def runTransaction(self):
        query = self.transactionInput.toPlainText()
        self.executeTransaction(query)

    def executeQuery(self, query, table):
        host = 'localhost'
        user = self.userSelection.currentText()
        password = ''  # Kullanıcı parolalarını buraya ekleyin
        database = 'db'
        
        if not query:
            QMessageBox.warning(self, "Eksik Bilgi", "Lütfen bir SQL sorgusu girin.")
            return
        
        try:
            conn = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database
            )
            cursor = conn.cursor()
            cursor.execute(query)
            
            if table:
                result = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
                
                table.setColumnCount(len(columns))
                table.setRowCount(len(result))
                table.setHorizontalHeaderLabels(columns)
                
                for row_idx, row_data in enumerate(result):
                    for col_idx, col_data in enumerate(row_data):
                        table.setItem(row_idx, col_idx, QTableWidgetItem(str(col_data)))
            
            conn.commit()
            cursor.close()
            conn.close()
        except mysql.connector.Error as err:
            QMessageBox.critical(self, "Bağlantı Hatası", f"Veritabanına bağlanırken hata oluştu:\n{str(err)}")
        except Exception as e:
            QMessageBox.critical(self, "Hata", f"Bir hata oluştu:\n{str(e)}")

    def executeTransaction(self, query):
        host = 'localhost'
        user = self.userSelection.currentText()
        password = ''  # Kullanıcı parolalarını buraya ekleyin
        database = 'db'
        
        if not query:
            QMessageBox.warning(self, "Eksik Bilgi", "Lütfen bir SQL sorgusu girin.")
            return
        
        try:
            conn = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database
            )
            cursor = conn.cursor()
            conn.start_transaction()
            for q in query.split(';'):
                if q.strip():
                    cursor.execute(q)
            conn.commit()
            cursor.close()
            conn.close()
            QMessageBox.information(self, "Başarılı", "Transaction başarıyla gerçekleştirildi.")
        except mysql.connector.Error as err:
            conn.rollback()
            QMessageBox.critical(self, "Bağlantı Hatası", f"Veritabanına bağlanırken hata oluştu:\n{str(err)}")
        except Exception as e:
            conn.rollback()
            QMessageBox.critical(self, "Hata", f"Bir hata oluştu:\n{str(e)}")

    def clearResults(self):
        self.queryInput.clear()
        self.resultsTable.clear()
        self.resultsTable.setRowCount(0)
        self.resultsTable.setColumnCount(0)

    def clearTriggerResults(self):
        self.triggerInput.clear()

    def clearViewResults(self):
        self.viewInput.clear()

    def clearTransactionResults(self):
        self.transactionInput.clear()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = SQLRunner()
    ex.show()
    sys.exit(app.exec_())
