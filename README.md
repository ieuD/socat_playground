Başlamadan önce scriptlere ait çalıştırma yetkisinin verildiğinden emin olunuz.
Kontrol için 
$ ls -laR

-rwxrwxr-{x} --> {x} ise çalıştırılabilir şekildedir.

-rw-rw-r-{-} --> {-} ise chmod +x dosya/yolu ile çalıştırılabilir hale getirilebilir.

Dosya Yapısı:

.
├── log
├── README.md
├── scripts
│   ├── client.sh
│   ├── nohup.out
│   ├── routing.sh
│   ├── tcp_server.sh
│   └── udp_server.sh
└── suplemental_scripts
    ├── tcp_forwarder.sh
    ├── tcp_server_logger.sh
    ├── udp_forwarder.sh
    └── udp_server_logger.sh
şeklindedir.

./log klasörü içerisinde log dosyalari olusturulmaktadir.
./scripts klasoru içerisinde ana script dosyaları bulunmaktadır.
./suplemental_scripts klasoru icerisinde ise. loglama işlemleri ve ana scriptler üzerinden tetiklenen scriptler bulunmaktadır.

client.sh
rasgele sayılar üretilerek paketlerin karıştırılması saglanıp. döngü içerisinde paketler udp ve tcp protokollerine göre gönderilmiştir.
**>eğer gönderilme işleminde hata var ise STDERR üzerinden yönlendirme yapılarak client_err.txt dosyasına yazma işlemi yapılmıştır.
--> gönderilmeye çalışılan bütün veriler ise client.txt dosyası içerisine yazılmıştır..

routing.sh
komutlar nohup ile arkaplan daemonu olarak çalıştırılmış olup. gelen her paket için komut tetiklendiğinde exec içerisinde yer alan supplemental scriptler çalıştırılmıştır. Böylelikle loglama işlemi ve yönlendirmeye ait gerçekleştirilmiştir.
 Not: yönlendirme işlemi socat üzerinden yapılabilmesine rağmen. EXEC ya da SYSTEM komutları çağrılamadığından dolayı string manipülasyonları yapılamamıştır. bu yüzden exec/system komutları kullanılmıştır.
 Not2: tcp udp dinleyicileri paralel olarak çalışmaktadır. fork ile her paket gelişinde subprocessler ile handling işlemi yapılmıştır.
NOT:3 ip dinamik olarak tanımlanmış olup. UNIX/LINUX dagıtımlarına gore degısıklık gosterebılır.
 tcp_server.sh ve udp_server.sh
 Route edilen verileri dinleyip. TCP_FORWARDER.sh ve UDP_FORWARDER.sh a yönlendirerek son log işlemleri yapılmıştır.


 NOHUP.out ile arkaplanda çalışan routing dinleyicilerine dair çıktılar toplanmıştır. Çıktı istenilmiyorsa /dev/null'a yönlendirme yapılabilir.
