# Data-stack

Data-stack build bằng docker-compose

## Getting Started

### Prerequisites

- Docker CE
- Docker-compose
- mysql client

### Installing

### Bước 1

Clone repo

### Bước 2

Sửa host file trên máy:

```
sudo vim /etc/hosts
```

Thêm dòng sau:
```
127.0.0.1 hadoop
```

![docker ps](./screenshots/addhost.png)

### Bước 3

Chạy:

```
docker-compose up -d
```

Đợi 1 lúc cho toàn bộ service đều chạy.

### Bước 4

Chạy lệnh sau để gửi file dữ liệu sample lên hadoop:

```
sh scripts/send-file.sh
```

### Bước 5

Chạy lệnh sau để  tạo bảng trên CSDL:

```
sh scripts/create-table.sh
```

## Spark code - Đọc và ghi dữ liệu từ hdfs

Truy cập vào jupiter, trên browser mở: [http://localhost:8888](http://localhost:8888)

Chạy: spark.ipynb

## Demo

1. Docker ps
![docker ps](./screenshots/docker.png)

2. Gửi file dữ liệu lên hadoop:
![hadoop](./screenshots/sendfile.png)

3. Tạo bảng trên CSDL:
![hadoop](./screenshots/createtable.png)

4. Kiểm tra file trên hadoop:
![hadoop](./screenshots/hadoopfs.png)

5. Đọc và ghi dữ liệu lên CSDL:
![hadoop](./screenshots/importdataframe.png)

6. Kiểm tra trên CSDL:
![hadoop](./screenshots/data.png)
