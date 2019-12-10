# ZadanieEwaluacyjne

W pliku tym zawarte są informacje dotyczące wykonania oraz przetestowania zadania ewaluacyjnego.

1. Aplikacja została osadzona w trzech repozytoriach github odpowiednio:
* https://github.com/gregKol/credit-repo.git
* https://github.com/gregKol/customer-repo.git
* https://github.com/gregKol/product-repo.git

2. Aplikacja została przetestowana w środowisku docker'owym. 
W katalogu docker znajdują się pliki niezbędne do odtworzenia środowiska. Aplikację uruchamia się przy użyciu pliku konfiguracyjnego docker-compose.yml (który to z kolei wykorzystuje pliki Dockerfile w podkatalogach). Za jego pomocą można uruchomić całe środowisko składające się z czterech kontenerów (trzy aplikacyjne oraz jeden bazodanowy):

```sh
docker-compose up -d
```

Po uruchomieniu kontenery są gotowe do użycia.
Aplikacja wykorzystuje proste testy jednoskotwe testujące tworzenie klienta oraz produktu.


TESTOWANIE:

1. Wywołanie usługi "createCredit" z wcześniej spreparowanymi danymi w formacie JSON metodą POST. Wywołanie zwracało numer kredytu. 
Przypadek 1:


```sh
{
	"client": {
		"firstname": "Adam",
		"surname": "Nowak",
		"pesel": "45434324234"
	},
	"product": {
		"productName": "Produkt 1",
		"productValue": 1500
	},
	"credit": {
		"creditName": "NazwaKredytu1"
	}
}
```

Przypadek 2:

```sh
{
	"client": {
		"firstname": "Marek",
		"surname": "Kowalski",
		"pesel": "546564345"
	},
	"product": {
		"productName": "Produkt 2",
		"productValue": 1455
	},
	"credit": {
		"creditName": "NazwaKredytu2"
	}
}
```

Przypadek 3:

```sh
{
	"client": {
		"firstname": "Adam",
		"surname": "Mickiewicz",
		"pesel": "99432234512"
	},
	"product": {
		"productName": "Produkt 3",
		"productValue": 3333333
	},
	"credit": {
		"creditName": "NazwaKredytu3"
	}
}
```

2. Wywołanie usługi "getCredit" zwraca wszystkie kredyty. Zwrotne otrzymano dane:

Info o numerach wszystkich kredytow:
```sh
Info o numerach wszystkich kredytów: 
[
	{
		"client": {
			"creditNumber": 102,
			"firstname": "Adam",
			"surname": "Nowak",
			"pesel": "45434324234"
		},
		"product": {
			"creditNumber": 102,
			"productName": "Produkt 1",
			"productValue": 1500
		},
		"credit": {
			"creditNumber": 102
		}
	},
	{
		"client": {
			"creditNumber": 103,
			"firstname": "Marek",
			"surname": "Kowalski",
			"pesel": "546564345"
		},
		"product": {
			"creditNumber": 103,
			"productName": "Produkt 2",
			"productValue": 1455
		},
		"credit": {
			"creditNumber": 103
		}
	},
	{
		"client": {
			"creditNumber": 106,
			"firstname": "Adam",
			"surname": "Mickiewicz",
			"pesel": "99432234512"
		},
		"product": {
			"creditNumber": 106,
			"productName": "Produkt 3",
			"productValue": 3333333
		},
		"credit": {
			"creditNumber": 106
		}
	}
]
```

Autor:
Grzegorz Kołodziej
