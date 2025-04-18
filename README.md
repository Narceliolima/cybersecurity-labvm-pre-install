# Cybersecurity LabVM Bootup
Scripts para instalação do Greenbone Community Edition e do DefectDojo em uma VM Debian 12 (Bookworm).

---

## 📦 Requisitos

Dispositivo com **[Debian 12 (Bookworm)](https://www.debian.org/releases/bookworm/)**

---

## Como utilizar?

### 😎 Passo 1 - Logue como usuário Root

```
sudo su
```

### 🛠 Passo 2 - Atualize o Sistema

```
apt update
```
```
apt upgrade
```

### 📝 Passo 3 - Baixe os Scripts, configure como executável e Execute

#### 🦴 Greenbone Community Edition

```
wget https://raw.githubusercontent.com/Narceliolima/projeto-allura-fipeconsulter/master/openvas_install.sh && \
	chmod +x openvas_install.sh
./openvas_install.sh
```

#### 👩‍💻 DefectDojo

```
wget https://raw.githubusercontent.com/Narceliolima/projeto-allura-fipeconsulter/master/defectdojo_install.sh && \
	chmod +x defectdojo_install.sh
./defectdojo_install.sh
```

---

## 💻 Tecnologias

- **[Greenbone Community Edition](https://community.greenbone.net/)**
- **[Docker](https://www.docker.com/)**
- **[DefectDojo](https://defectdojo.com/community)**

---

## 🖇Referência

 - [Script para instalação do Greenbone Community Edition no Debian 12 disponibilizado por Kastervo](https://github.com/Kastervo/OpenVAS-Installation)