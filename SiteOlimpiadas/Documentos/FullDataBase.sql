USE [master]
GO
/****** Object:  Database [Olimpiadas]    Script Date: 06/02/2016 23:56:03 ******/
CREATE DATABASE [Olimpiadas] ON  PRIMARY 
( NAME = N'Olimpiadas', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Olimpiadas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Olimpiadas_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Olimpiadas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Olimpiadas] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Olimpiadas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Olimpiadas] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Olimpiadas] SET ARITHABORT OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Olimpiadas] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Olimpiadas] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Olimpiadas] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Olimpiadas] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Olimpiadas] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Olimpiadas] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Olimpiadas] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Olimpiadas] SET  DISABLE_BROKER
GO
ALTER DATABASE [Olimpiadas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Olimpiadas] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Olimpiadas] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Olimpiadas] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Olimpiadas] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Olimpiadas] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Olimpiadas] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Olimpiadas] SET  READ_WRITE
GO
ALTER DATABASE [Olimpiadas] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Olimpiadas] SET  MULTI_USER
GO
ALTER DATABASE [Olimpiadas] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Olimpiadas] SET DB_CHAINING OFF
GO
USE [Olimpiadas]
GO
/****** Object:  Table [dbo].[Tutorial]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutorial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeTutorial] [varchar](50) NOT NULL,
	[DescTutorial] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tutorial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tutorial] ON
INSERT [dbo].[Tutorial] ([ID], [NomeTutorial], [DescTutorial]) VALUES (2, N'Como fazer login', N'Teste')
INSERT [dbo].[Tutorial] ([ID], [NomeTutorial], [DescTutorial]) VALUES (3, N'Como criar uma conta', N'Crie a conta')
SET IDENTITY_INSERT [dbo].[Tutorial] OFF
/****** Object:  Table [dbo].[Perfil]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON
INSERT [dbo].[Perfil] ([ID], [DescPerfil]) VALUES (8, N'Admin     ')
INSERT [dbo].[Perfil] ([ID], [DescPerfil]) VALUES (9, N'Operacional')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
/****** Object:  Table [dbo].[Modalidade]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modalidade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescModalidade] [varchar](max) NOT NULL,
	[InfoModalidade] [varchar](max) NULL,
 CONSTRAINT [PK_Modalidade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Modalidade] ON
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (1, N'Vôlei de Praia', N'O vôlei de praia é praticado numa quadra, demarcada com fita, na areia. As medidas são: 16 metros de comprimento por 8 metros de largura. No meio, deve ficar uma rede que mede 2,43 metros de altura (masculino) ou 2,24 metros (feminino).')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (2, N'Voleibol', N'O vôlei, também chamado de volley ou voleibol, é um esporte de origem norte-americana do século XIX. É um esporte de popularidade significativa em grande parte do mundo, e está presente em muitos torneios e eventos esportivos de âmbito internacionais, tais como os Jogos Olímpicos e os Jogos Panamericanos. Pode ser praticado tanto em quadras abertas quanto em quadras fechadas, bem como é praticado quase que igualmente tanto por homens quanto mulheres.')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (3, N'Ginástica Artística', N'A ginástica artística, também conhecida como ginástica olímpica é um esporte que requer força, agilidade, coordenação, controle do corpo, flexibilidade, equilíbrio e elegância. Os ginastas realizam exercícios em aparelhos oficiais.')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (4, N'Futebol', N'O objetivo do jogo de futebol é conduzir uma bola na baliza da equipe adversária, a fim de marcar um ponto. A equipe quie tiver mas pontos no final de uma partida de futebol ganha; se houver um empate, o jogo vai para a prorrogação ou o árbitro declara um empate. O futebol é jogado ao ar livre em um campo retangular de grama ou turfe, com uma baliza localizada no meio de ambas as extremidades curtas do campo. O futsal é semelhante, embora a quadra seja menor. Existem 11 membros em cada equipe, jogando atacante, meio-campo, zagueiro e goleiro.')
SET IDENTITY_INSERT [dbo].[Modalidade] OFF
/****** Object:  Table [dbo].[Local]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Local](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescLocal] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Local] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Local] ON
INSERT [dbo].[Local] ([ID], [DescLocal]) VALUES (1, N'São Paulo')
INSERT [dbo].[Local] ([ID], [DescLocal]) VALUES (2, N'Belo Horizonte')
SET IDENTITY_INSERT [dbo].[Local] OFF
/****** Object:  Table [dbo].[InformacaoBH]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InformacaoBH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TipoInformacao] [varchar](100) NOT NULL,
	[Imagem] [varchar](max) NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descricao] [varchar](max) NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Endereco] [varchar](max) NULL,
 CONSTRAINT [PK_InformacaoBH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[InformacaoBH] ON
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (1, N'HOTEL', N'HotelIbis2.jpg', N'Ibis Savassi', N'Localizado na região da Savassi, a 42 km do aeroporto e a 100 metros do Shopping Pátio Savassi, o Ibis BH Savassi está situado no pólo negocial, comercial e de entretenimento da cidade de Belo Horizonte, sendo uma das regiões mais prestigiadas da capitalmineira. Distância entre as principais cidades e seus atrativos: a) 95 km de Ouro Preto b) 100 km da Serra do Sipó c) 25 km de Sabará d) 188 km de Tiradentes. Contamos com internet wi-fi grátis.
Hotel econômico com 208 apartamentos, voltagem 220/240 V, ar condicionado, Telefone, TV LCD a cabo, frigobar, serviço automático de despertador e via telefonista, internet wi-fi free nos apartamentos, banheiro privativo com secadores de cabelo.
', -19.93418, -43.936762, N'Av Do Contorno 6180 | Savassi, Belo Horizonte, Minas Gerais 30110042, Brasil')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (2, N'HOTEL', N'HotelMercure3.jpg', N'Hotel Mercure Belo Horizonte Lifecenter', N'Situado no centro de Belo Horizonte, o Mercure Belo Horizonte Lifecenter Hotel encontra-se a cerca de 5 km de alguns dos principais ex-líbris da região, incluindo Museu dos Brinquedos e Praça da Liberdade. Este aparthotel encontra-se ainda nas imediações de outros pontos de interesse, incluindo Teatro Sesiminas e Museu de Telecomunicação Oi Futuro.', -19.934639, -43.924107, N'Rua Cícero Ferreira, 10 | Serra, Belo Horizonte, Minas Gerais 3022004, Brasil

')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (3, N'HOTEL', N'HotelFinancial1.jpg', N'Hotel Financial', N'Se o seu destino é Belo Horizonte, hospede-se no tradicional Hotel Financial. Totalmente reformado e com instalações modernas, e com certeza uma das melhores opções da cidade.Preços especiais para grupos e eventos em geral. Restaurante, garagem, salas para reuniões, internet e tudo mais para para seu conforto.

O Hotel Financial está localizado em um ponto estratégico de Belo Horizonte, na Avenida Afonso Pena, com fácil acesso aos principais Centros de Convenções, Barro Preto (Pólo da Moda de BH), Parque Municipal e centros comerciais.
', -19.918091, -43.938848, N'Avenida Afonso Pena, 571 | Centro, Belo Horizonte, Minas Gerais 30130, Brasil')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (4, N'RESTAURANTE', N'RestauranteVerano1.jpg', N'Verano Gourmet', N'Formado pela combinação do melhor da cozinha contemporânea a um cardápio completo, o Verano Gourmet é a materialização dos prazeres que a gastronomia pode lhe proporcionar. A casa é perfeita para quem busca desfrutar novas experiências gastronômicas. Estruturado em três ambientes extremamente aconchegantes, o espaço é comando pela Chef Simone Brandão. Ele seleciona minuciosamente cada ingrediente, para que os pratos tenham a excelência que os clientes merecem e a qualidade que é tão importante para o local. Com um vasto cardápio composto por deliciosos e inusitados pratos e petiscos, o Verano busca surpreender sempre, com experiências únicas.', -19.934667, -43.955904, N'Rua Ludgero Dolabela, 738 - Gutierrez')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (5, N'RESTAURANTE', N'RestauranteYakan3.jpg', N'Yakan Lounge
', N'Localizado na Savassi, uma das regiões mais prestigiadas de Belo Horizonte, o Yakan Lounge conta com instalações modernas e ambiente bem sofisticado, proporcionando um clima intimista. O cardápio à la carte é rico na culinária Nikkei – fusão da gastronomia nipônica com a peruana – e oferece pratos incríveis, como o Ebi Sake Gun Kan (camarão e cream cheese envolto em sashimi de salmão maçaricado) e o Tiradito de Polvo. Há também a opção de rodízio, que permite experimentar de forma única os sabores do Peru e do Japão ao mesmo tempo. Para sobremesa, a sugestão é o Petit Gateau acompanhado de sorvete de macadâmia. O local é perfeito para jantares em família, confraternizações e eventos corporativos, além de garantir excelentes momentos de degustação.', -19.939434, -43.930874, N'Avenida do Contorno, 5757 - Savassi')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (6, N'RESTAURANTE', N'RestauranteSapore2.jpg', N'Sapore D'' Italia Cucina Regionale Italiana', N'Com uma proposta interessante, o Sapore D'' Italia Cucina Regionale Italiana reúne o que há de melhor da culinária italiana em um ambiente aconchegante e requintado. O restaurante preza pela alta gastronomia em receitas clássicas e únicas. Os pratos são criações do chef Gabriel Carvalho, que usa produtos genuinamente italianos, com exceção das carnes e frutos do mar. As massas são produzidas de forma artesanal no atelier do restaurante e com receitas do chef. 
A cozinha é aberta para o salão, assim é possível até conversar com os funcionáriosenquanto o prato está sendo preparado. Além disso, os clientes podem sentir os aromas e assistir ao preparo dos pratos. O cardápio é premiado, apresentando diferentes opções de massas, como o Gamberi Confite e Verdure, o Antipasti di Mare, o Patè di Carne di Granchio, o Caserecce Siciliane al Sugo di Salsiccia, o Baccalà Gadus Morhua Porto Imperial Confite e Grigliati. 
A carta de vinhos do Sapore D'' Italia é composta de rótulos nacionais e internacionais. Completando a boa refeição estão as sobremesas, com destaque para o Sgroppino: sobremesa veneziana feita com creme de morangos, sorvete de torta de limão e espumante, além de Tiramisu, o Crema de Mascarpone e outras opções deliciosas.
', -19.942258, -43.936046, N'Rua Mestre Luiz, 64 - São Pedro')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (8, N'PONTO TURISTICO', N'Ponto3.jpg', N'Museu Inimá de Paula', N'Após o registro de quase duas mil obras em seis anos e da edição histórica de dois volumes de obras catalogadas, a diretoria da Fundação deu inicio à viabilização do museu que eterniza a grande obra e a história de vida desse grande pintor mineiro.
Criar, instalar e manter um museu destinado à exposição permanente de obras e dos itens pertencentes ao acervo da Fundação Inimá de Paula foi um sonho realizado. Um local digno do artista, onde suas obras, documentos, fotografias, livros, objetos pessoais e instrumentos de trabalho são guardados e exibidos, bem como ter acesso fácil a informações, documentários e áudio-visuais sobre o artista, garantindo assim sua história e integridade.
O espaço tem como objetivo não somente servir à divulgação da vida e obra de Inimá, mas também o de abrigar eventos culturais em geral, caracterizando-se com um local aberto à exposições de artistas, seminários, cursos, workshops e outros eventos afins. Agindo assim, o Museu Inimá de Paula se torna um polo emissor cultural ativo e dinâmico.
', -19.92509, -43.937332, N'R. da Bahia, 1201 - Centro, Belo Horizonte - MG, 30160-011')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (9, N'PONTO TURISTICO', N'Ponto1.jpg', N'Mineirão - Estádio Governador Magalhães Pinto', N'Inaugurado em 1965, com o objetivo de atender uma demanda crescente de público em jogos dos principais times da capital, o Mineirão foi determinante para o desenvolvimento do futebol de Belo Horizonte nos cenários nacional e internacional. O “Gigante da Pampulha”, hoje com capacidade para 62 mil lugares, passou por reforma para a Copa do Mundo, ganhando uma série de melhorias para jogadores, torcedores e jornalistas, que deixaram o estádio no padrão dos principais palcos do futebol mundial.', -20.025, -44.0282, N'Av. Antônio Abrahão Caran, 1001 - São José, Belo Horizonte - MG, 31275-000')
INSERT [dbo].[InformacaoBH] ([ID], [TipoInformacao], [Imagem], [Titulo], [Descricao], [Latitude], [Longitude], [Endereco]) VALUES (10, N'PONTO TURISTICO', N'Ponto2.jpg', N'Igreja da Pampulha', N'Uma das principais atrações do conjunto arquitetônico e urbanístico da Pampulha, a Igreja São Francisco de Assis, emoldurada pelas águas da lagoa, reúne as genialidades do arquiteto Oscar Niemeyer, do paisagista Burle Marx e do pintor Cândido Portinari. A combinação gerou a construção em tons azuis, com linhas e curvas totalmente revestida por azulejos e pelos painéis que retratam a Via Sacra e a imagem de São Francisco.
A igreja permaneceu durante 14 anos proibida ao culto. Aos olhos do arcebispo Dom Antônio dos Santos Cabral,a igrejinha era apenas um galpão, apesar de, em seu interior, abrigara Via Sacra, constituída por 14 painéis de Cândido Portinari, considerada uma de suas obras mais significativas. Os painéis externos também são de Cândido Portinari– painel figurativo, e de Paulo Werneck –painel abstrato. Os jardins são assinados por Burle Marx.
A Igreja da Pampulha é tombada pelo Instituto do Patrimônio Histórico e Artístico Nacional (IPHAN), pelo Instituto Estadual do Patrimônio Histórico e Artístico de Minas Gerais (IEPHA/MG)e pela Gerência do Patrimônio Municipal.
', -19.8584, -43.979, N'Avenida Otacílio Negrão de Lima, 3000 - Pampulha, Belo Horizonte - MG, 31365-450')
SET IDENTITY_INSERT [dbo].[InformacaoBH] OFF
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[CPF] [varchar](150) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Senha] [varchar](150) NOT NULL,
	[Logradouro] [varchar](150) NOT NULL,
	[Numero] [int] NOT NULL,
	[Bairro] [varchar](150) NOT NULL,
	[Cidade] [varchar](150) NOT NULL,
	[UF] [varchar](150) NOT NULL,
	[DataNascimento] [varchar](150) NOT NULL,
	[Perfil_ID] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([ID], [Nome], [CPF], [Email], [Senha], [Logradouro], [Numero], [Bairro], [Cidade], [UF], [DataNascimento], [Perfil_ID]) VALUES (1, N'Ana Lu', N'11900266601', N'ana@hotmail.com', N'202cb962ac59075b964b07152d234b70', N'Av dos Jardins', 572, N'Lindéia', N'Belo Horizonte', N'MG', N'1995-08-26', 8)
INSERT [dbo].[Usuario] ([ID], [Nome], [CPF], [Email], [Senha], [Logradouro], [Numero], [Bairro], [Cidade], [UF], [DataNascimento], [Perfil_ID]) VALUES (2, N'Warlen', N'123464552', N'warlen@hotmail.com', N'202cb962ac59075b964b07152d234b70', N'Avenida', 852, N'Betania', N'Belo Horizonte', N'MG', N'2005-08-26', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[Evento]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Modalidade_ID] [int] NOT NULL,
	[Local_ID] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Horario] [varchar](50) NOT NULL,
	[NomeEvento] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Evento] ON
INSERT [dbo].[Evento] ([ID], [Modalidade_ID], [Local_ID], [Data], [Horario], [NomeEvento]) VALUES (1, 1, 1, CAST(0x0000A66800000000 AS DateTime), N'10:00', N'Abertura da Olimpíada')
INSERT [dbo].[Evento] ([ID], [Modalidade_ID], [Local_ID], [Data], [Horario], [NomeEvento]) VALUES (2, 2, 2, CAST(0x0000A65E00000000 AS DateTime), N'17:00', N'Final Brasil x Uruguai')
SET IDENTITY_INSERT [dbo].[Evento] OFF
/****** Object:  Table [dbo].[EventoUsuario]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoUsuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[Evento_ID] [int] NOT NULL,
 CONSTRAINT [PK_EventoUsuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EventoUsuario] ON
INSERT [dbo].[EventoUsuario] ([ID], [Usuario_ID], [Evento_ID]) VALUES (3, 1, 2)
INSERT [dbo].[EventoUsuario] ([ID], [Usuario_ID], [Evento_ID]) VALUES (4, 1, 1)
SET IDENTITY_INSERT [dbo].[EventoUsuario] OFF
/****** Object:  Table [dbo].[Ingresso]    Script Date: 06/02/2016 23:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Evento_ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_Ingresso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Usuario_Perfil]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([Perfil_ID])
REFERENCES [dbo].[Perfil] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  ForeignKey [FK_Evento_Local]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Local] FOREIGN KEY([Local_ID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Local]
GO
/****** Object:  ForeignKey [FK_Evento_Modalidade]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Modalidade] FOREIGN KEY([Modalidade_ID])
REFERENCES [dbo].[Modalidade] ([ID])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Modalidade]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Evento]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Evento] FOREIGN KEY([Evento_ID])
REFERENCES [dbo].[Evento] ([ID])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Evento]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Usuario]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Usuario] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Usuario]
GO
/****** Object:  ForeignKey [FK_Ingresso_Evento]    Script Date: 06/02/2016 23:56:07 ******/
ALTER TABLE [dbo].[Ingresso]  WITH CHECK ADD  CONSTRAINT [FK_Ingresso_Evento] FOREIGN KEY([Evento_ID])
REFERENCES [dbo].[Evento] ([ID])
GO
ALTER TABLE [dbo].[Ingresso] CHECK CONSTRAINT [FK_Ingresso_Evento]
GO
