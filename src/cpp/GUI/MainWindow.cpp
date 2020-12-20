#include "MainWindow.hpp"

#include "ui/ui_mainwindow.h"

MainWindow::MainWindow(QWidget* parent_)
    : QMainWindow(parent_)
    , m_ui(new Ui::MainWindow)
{
    m_ui->setupUi(this);
    m_image.load(":/assets/bunny.jpg");
}

MainWindow::~MainWindow()
{
    delete m_ui;
}

void MainWindow::on_button_clicked()
{
    if (m_ui->image->pixmap(Qt::ReturnByValue).isNull() && !m_image.isNull()) {
        m_ui->image->setPixmap(m_image);
        m_ui->image->setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    }
}
