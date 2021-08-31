object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 632
  Width = 323
  object sqlVerificaTimesTrades: TFDQuery
    SQL.Strings = (
      'select id from remora.times_trades'
      'where data_hora = :data_hora'
      'and ativo = :ativo')
    Left = 176
    Top = 96
    ParamData = <
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
  end
  object sqlInsereTimesTrades: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'insert into  remora.times_trades'
      
        '(ativo, data_hora, corretora_compra, corretora_venda, agressor, ' +
        'qtd, preco, variacao_abertura)'
      'values'
      
        '(:ativo, :data_hora, :corretora_compra, :corretora_venda, :agres' +
        'sor, :qtd, :preco, :variacao_abertura)')
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'CORRETORA_COMPRA'
        ParamType = ptInput
      end
      item
        Name = 'CORRETORA_VENDA'
        ParamType = ptInput
      end
      item
        Name = 'AGRESSOR'
        ParamType = ptInput
      end
      item
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        Name = 'VARIACAO_ABERTURA'
        ParamType = ptInput
      end>
    Left = 48
    Top = 24
  end
  object sqlForcaLivroOfertas: TFDQuery
    SQL.Strings = (
      'select sum(qtd) qtd_ofertas, '#39'C'#39' operacao, max(preco) preco'
      'from (select qtd, preco from remora.livro_ofertas'
      'where ativo = :ativo'
      'and preco != 0'
      'and id_tt = :id_tt'
      'and operacao = '#39'C'#39
      'order by preco desc limit :qtd_ref_livro) as media_compra'
      'union'
      'select sum(qtd) qtd_ofertas, '#39'V'#39' operacao, min(preco) preco'
      'from (select qtd, preco from remora.livro_ofertas'
      'where ativo = :ativo'
      'and preco != 0'
      'and id_tt = :id_tt'
      'and operacao = '#39'V'#39
      'order by preco limit :qtd_ref_livro) as media_compra')
    Left = 176
    Top = 168
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'ID_TT'
        ParamType = ptInput
      end
      item
        Name = 'QTD_REF_LIVRO'
        ParamType = ptInput
      end>
  end
  object sqlMediaPreco: TFDQuery
    SQL.Strings = (
      'select cast(sum(preco)/sum(qtd) as decimal(15,2)) media_preco'
      'from'
      '(select preco*qtd preco, qtd from remora.times_trades'
      '   where ativo = :ativo'
      '   and data_hora <= :data_hora'
      '   and data_hora >= :data'
      '   and preco !=0 '
      '   and id <= :id_ref'
      '   and qtd <= :qtd_menor'
      '   order by data_hora desc'
      '    limit :ultimos) as ultimos_precos')
    Left = 176
    Top = 24
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'ID_REF'
        ParamType = ptInput
      end
      item
        Name = 'QTD_MENOR'
        ParamType = ptInput
      end
      item
        Name = 'ULTIMOS'
        ParamType = ptInput
      end>
  end
  object sqlVerificaLivroOfertas: TFDQuery
    SQL.Strings = (
      'select id from remora.livro_ofertas'
      'where ativo = :ativo'
      'and data_hora = :data_hora'
      'and qtd = :qtd'
      'and preco = :preco')
    Left = 48
    Top = 88
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        Name = 'PRECO'
        ParamType = ptInput
      end>
  end
  object sqlInsereLivroOfertas: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'insert into remora.livro_ofertas'
      '(ativo, data_hora, corretora, operacao, qtd, preco, id_tt)'
      'values'
      
        '(:ativo, :data_hora, :corretora, :operacao, :qtd, :preco, :id_tt' +
        ')')
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'CORRETORA'
        ParamType = ptInput
      end
      item
        Name = 'OPERACAO'
        ParamType = ptInput
      end
      item
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        Name = 'ID_TT'
        ParamType = ptInput
      end>
    Left = 48
    Top = 152
  end
  object sqlUltimaNegociacao: TFDQuery
    SQL.Strings = (
      'select id, data_hora, variacao_abertura , preco '
      'from remora.times_trades'
      'where id ='
      '(select max(id) from remora.times_trades'
      'where ativo = :ativo'
      'and data_hora <= :data_hora'
      'and date(data_hora) >= :data )')
    Left = 176
    Top = 232
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object sqlInsereLog: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'insert into  remora.log_analise'
      '(ativo, data_hora, texto)'
      'values'
      '(:ativo, :data_hora, :texto)')
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'TEXTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2000
      end>
    Left = 48
    Top = 216
  end
  object sqlUltimoID: TFDQuery
    SQL.Strings = (
      'select max(id) id from remora.times_trades'
      'where ativo = :ativo')
    Left = 48
    Top = 288
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
  end
  object sqlLimpaTimesTrades: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'delete from remora.times_trades'
      #10'where date(data_hora) = :data'
      'and ativo = :ativo')
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
    Left = 48
    Top = 352
  end
  object sqlLimpaLivro: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      #10'delete from remora.livro_ofertas'#10
      'where date(data_hora) = :data'
      'and ativo = :ativo')
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
    Left = 176
    Top = 288
  end
  object sqlReplayDolar: TFDQuery
    SQL.Strings = (
      'select data_hora from remora.times_trades'
      'where date(data_hora) = :data '
      'and ativo = :ativo'
      'order by id')
    Left = 51
    Top = 424
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
  end
  object sqlReplayIndice: TFDQuery
    SQL.Strings = (
      'select data_hora from remora.times_trades'
      'where date(data_hora) = :data '
      'and ativo = :ativo'
      'order by id')
    Left = 171
    Top = 353
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end>
  end
  object sqlResultados: TFDQuery
    SQL.Strings = (
      'Select data, resultado from remora.resultados'
      'where ativo = :ativo and'
      'data >= :data_ini and data <= :data_fim '
      'order by data')
    Left = 168
    Top = 424
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_INI'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FIM'
        ParamType = ptInput
      end>
  end
  object sqlInsereResultado: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'insert into remora.resultados'
      '(ativo, data, op_positivas, op_negativas, resultado)'
      'values'
      '(:ativo, :data, :op_positivas, :op_negativas, :resultado)')
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'OP_POSITIVAS'
        ParamType = ptInput
      end
      item
        Name = 'OP_NEGATIVAS'
        ParamType = ptInput
      end
      item
        Name = 'RESULTADO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 496
  end
  object sqlLimpaResultado: TFDCommand
    CommandKind = skInsert
    CommandText.Strings = (
      'delete from remora.resultados'
      'where ativo = :ativo and data = :data')
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end>
    Left = 56
    Top = 496
  end
  object sqlVariacaoPreco: TFDQuery
    SQL.Strings = (
      'select abs(min(preco) - max(preco)) variacao from'
      '(select preco from remora.times_trades'
      '   where ativo = :ativo'
      '   and preco !=0 '
      '   and data_hora <= :data_hora'
      '   and data_hora >= :data'
      '   and id <= :id_ref'
      '   and qtd <= :qtd_menor'
      '   order by data_hora desc'
      '    limit :ultimos) variacao_preco')
    Left = 264
    Top = 24
    ParamData = <
      item
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'ID_REF'
        ParamType = ptInput
      end
      item
        Name = 'QTD_MENOR'
        ParamType = ptInput
      end
      item
        Name = 'ULTIMOS'
        ParamType = ptInput
      end>
  end
end
