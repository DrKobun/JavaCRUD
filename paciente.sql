-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/05/2025 às 22:35
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `paciente`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id` int(11) NOT NULL,
  `idPaciente` int(10) NOT NULL,
  `dataAtendimento` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`id`, `idPaciente`, `dataAtendimento`, `status`) VALUES
(89, 79, '2025-05-26 18:58:55', 'Aguardando Triagem'),
(90, 84, '2025-05-26 18:59:35', 'Aguardando Triagem'),
(91, 84, '2025-05-26 19:06:09', 'Aguardando Triagem'),
(92, 84, '2025-05-26 19:08:26', 'Aguardando Triagem'),
(93, 84, '2025-05-26 19:10:02', 'Aguardando Triagem'),
(94, 84, '2025-05-26 21:34:00', 'Aguardando Triagem'),
(95, 84, '2025-05-26 21:34:19', 'Aguardando Triagem'),
(96, 84, '2025-05-26 21:46:19', 'Aguardando Triagem'),
(97, 84, '2025-05-26 21:51:24', 'Aguardando Triagem'),
(98, 84, '2025-05-26 22:23:19', 'Aguardando Triagem'),
(99, 84, '2025-05-26 22:23:30', 'Aguardando Triagem'),
(100, 79, '2025-05-26 22:23:32', 'Aguardando Triagem'),
(101, 77, '2025-05-26 22:23:33', 'Aguardando Triagem'),
(102, 84, '2025-05-27 16:17:05', 'Aguardando Triagem'),
(103, 84, '2025-05-27 17:20:50', 'Aguardando Triagem'),
(104, 84, '2025-05-27 18:31:05', 'Aguardando Triagem'),
(105, 0, '2025-05-27 21:08:43', 'Aguardando Triagem'),
(106, 84, '2025-05-27 21:19:29', 'Aguardando Triagem'),
(107, 84, '2025-05-27 21:20:13', 'Aguardando Triagem'),
(108, 0, '2025-05-27 21:38:33', 'Aguardando Triagem'),
(109, 87, '2025-05-27 21:38:54', 'Aguardando Triagem'),
(110, 87, '2025-05-27 21:48:45', 'Aguardando Triagem'),
(111, 84, '2025-05-27 21:48:52', 'Aguardando Triagem'),
(112, 79, '2025-05-27 21:48:53', 'Aguardando Triagem'),
(113, 77, '2025-05-27 21:48:54', 'Aguardando Triagem'),
(114, 87, '2025-05-27 21:49:53', 'Aguardando Triagem'),
(115, 84, '2025-05-27 21:49:55', 'Aguardando Triagem'),
(116, 79, '2025-05-27 21:49:55', 'Aguardando Triagem'),
(117, 77, '2025-05-27 21:49:57', 'Aguardando Triagem'),
(118, 77, '2025-05-29 19:28:08', 'Aguardando Triagem'),
(119, 88, '2025-05-29 19:35:01', 'Aguardando Triagem'),
(120, 88, '2025-05-29 21:57:41', 'Aguardando Triagem'),
(121, 88, '2025-05-29 23:08:42', 'Aguardando Triagem'),
(122, 88, '2025-05-30 16:34:17', 'Aguardando Triagem'),
(123, 89, '2025-05-30 17:27:44', 'Aguardando Triagem');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id`, `email`, `senha`) VALUES
(7, 'a', 'a'),
(8, 'b', 'b'),
(9, 'h', 'h'),
(10, 'asdf', 'asdf'),
(11, 'asdf', 'asdf'),
(12, 'f', 'f');

-- --------------------------------------------------------

--
-- Estrutura para tabela `loginpaciente`
--

CREATE TABLE `loginpaciente` (
  `id` int(11) NOT NULL,
  `idTriagem` int(11) NOT NULL,
  `idAtendimento` int(11) NOT NULL,
  `nomePaciente` varchar(200) NOT NULL,
  `avaliacao` int(11) NOT NULL,
  `observacoes` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `loginpaciente`
--

INSERT INTO `loginpaciente` (`id`, `idTriagem`, `idAtendimento`, `nomePaciente`, `avaliacao`, `observacoes`) VALUES
(1, 59, 120, 'FOREVER', 0, ''),
(2, 60, 121, 'FOREVER', 0, ''),
(3, 57, 118, 'Walyson da Costa Ferreira', 3, 'qerqwer'),
(4, 62, 123, 'SOCORRO JESUS!', 5, 'foi muito bom o atendimento!');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `codigo` int(200) DEFAULT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `idade` int(2) NOT NULL,
  `idusuario` int(10) NOT NULL,
  `dataPaciente` date NOT NULL,
  `dataNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `codigo`, `nome`, `telefone`, `cpf`, `idade`, `idusuario`, `dataPaciente`, `dataNascimento`) VALUES
(77, NULL, 'Walyson da Costa Ferreira', '40028922', '079.848.524', 21, 7, '2025-05-25', '2003-05-25'),
(79, NULL, 'Evelyn Cosffer', '4002-8922', '123.123.123', 25, 7, '2025-05-25', '2025-07-25'),
(84, NULL, 'VIVA', '12', '12', 212, 7, '2025-05-26', '2025-05-27'),
(87, NULL, 'EVERLASTING', '123123', '123123123', 30, 12, '2025-05-27', '2025-05-27'),
(88, NULL, 'FOREVER', '123123123', '123', 22, 7, '2025-05-29', '2025-05-30'),
(89, NULL, 'SOCORRO JESUS!', '40028922', '123123123', 22, 7, '2025-05-30', '2025-05-27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `triagem`
--

CREATE TABLE `triagem` (
  `id` int(11) NOT NULL,
  `idAtendimento` int(11) DEFAULT NULL,
  `pressao` varchar(50) DEFAULT NULL,
  `peso` decimal(4,2) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  `observacoes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `triagem`
--

INSERT INTO `triagem` (`id`, `idAtendimento`, `pressao`, `peso`, `altura`, `observacoes`) VALUES
(57, 118, '12/8', 65.00, 1.52, 'BLA BLA BLA BLALB ALB ALB LA BAL'),
(58, 119, '12/18', 65.00, 1.75, 'O MANO ESTA TENDO UM ATAQUE DO MIOCARDIO CATASTROFICO! :O'),
(59, 120, '123', 11.00, 22.00, '123123'),
(60, 121, '22', 22.00, 22.00, '22'),
(61, 122, '', 0.00, 0.00, ''),
(62, 123, '10/7', 75.00, 1.77, 'JESUS');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `loginpaciente`
--
ALTER TABLE `loginpaciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `triagem`
--
ALTER TABLE `triagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAtendimento` (`idAtendimento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `loginpaciente`
--
ALTER TABLE `loginpaciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `triagem`
--
ALTER TABLE `triagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `triagem`
--
ALTER TABLE `triagem`
  ADD CONSTRAINT `triagem_ibfk_1` FOREIGN KEY (`idAtendimento`) REFERENCES `atendimento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
