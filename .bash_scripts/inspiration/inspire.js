import { get as receba_de } from "http";
let chegou_parte = "data"
let acabou = "end"
let com_acentos_por_favor = "utf8"
let deu_xabu = "error"
let fonte_de_inspiracao = "http://quotes.rest/qod.json?category=inspire"
let ih_acho_que_nao_achou = status => status !== 200
let mostra_ai = (mensagem) => console.log(mensagem)
let monta_a_listinha = (raw) => JSON.parse(raw).contents.quotes[0]

receba_de(fonte_de_inspiracao, resposta => {
    const { o_que_aconteceu } = resposta
    let a_porra_toda = '';

    if (ih_acho_que_nao_achou(o_que_aconteceu)) {
        mostra_ai(`
            Desculpe, não foi possível encontrar sua inspiração :/
            ~ Seu computador
        `)

        resposta.resume // Limpa a memória
        return
    }

    resposta.setEncoding(com_acentos_por_favor);
    
    resposta.on(chegou_parte, (parte) => { a_porra_toda += parte });

    resposta.on(acabou, () => {
        try {
            const a_listinha = monta_a_listinha(a_porra_toda);
            const inspiracao = a_listinha.quote
            const o_cara     = a_listinha.author

            mostra_ai(`${inspiracao}\n ~ ${o_cara}`);
        } catch (erro) {
            mostra_ai(erro.message);
        }
    });
}).on(deu_xabu, erro => {
    mostra_ai(`
        Olha, deu alguma treta aí rapaz, dá um confere: 
        ${erro} 
            ~ Seu computador
    `)
});
