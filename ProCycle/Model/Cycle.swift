//
//  Cycle.swift
//  ProCycle
//
//  Created by mvitoriapereirac on 31/05/23.
//

import SwiftUI
struct CycleInfo {
    let phaseDescription: String
    let phaseExpandedDescription: String
    let phaseName: String
    
}

extension CycleInfo {
    static func getMenstrualInfo() -> [CycleInfo] {
        return [CycleInfo(phaseDescription: "Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e evite a pressão de prazos inflexíveis. Seja gentil consigo e permita-se trabalhar no seu tempo, sem cobranças desnecessárias. ", phaseExpandedDescription: "Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis. Seja gentil consigo e permita-se trabalhar no seu tempo, sem cobranças desnecessárias: ter momentos de oscilação de comportamento é apenas parte natural do seu ciclo hormonal. Esse é um bom momento para atividades leves e introspectivas: coloque suas leituras, filmes e séries em dia. Lembre-se de hidratar-se e comer bem. Não reprima suas vontades: o consumo de carboidratos como chocolates pode ajudar a aliviar sintomas físicos e emocionais associados à menstruação - é ciência. Procure evitar agendar atividades sociais muito demandantes nos primeiros dias da sua menstruação. Evite também atividades que demandem demais do seu físico: exercícios leves são recomendados, mas nunca obrigatórios. No que diz respeito a atividades físicas, nesse período é mais recomendado pegar pesos mais leves, fazer um cardio leve e focar em exercícios de alongamento e mobilidade. Lembre-se de portar com você analgésicos, absorventes ou outros itens que façam parte da sua higiene menstrual!", phaseName: "Período menstrual")
        ]
    }
    
    static func getFolicularInfo() -> [CycleInfo] {
        return [CycleInfo(phaseDescription: "Níveis de energia mais elevados durante essa fase. Bom momento para aprender coisas novas, concluir trabalhos criativos e iniciar novos projetos, graças a uma maior tendência à proatividade. Sua mente está mais aberta à realização de tarefas complexas, por isso é uma boa ideia agendar reuniões e trabalhos mais intensos. ", phaseExpandedDescription: "Níveis de energia mais elevados durante essa fase. Bom momento para aprender coisas novas, concluir trabalhos criativos e iniciar novos projetos, graças a uma maior tendência à proatividade. Sua mente está mais aberta à realização de tarefas  complexas, por isso é uma boa ideia agendar reuniões e trabalhos mais intensos.  Momento muito propício para atividades cognitivas, como estudos e trabalho. Invista em projetos mais complexos sem medo. Bom momento do ciclo para exercícios físicos de maior impacto. Dica: uma rotina regular de exercícios é um grande aliado na diminuição de sintomas menstruais! No que diz respeito a atividades físicas, é recomendado aumentar a intensidade nas cargas e no cardio, como corrida.", phaseName: "Fase folicular")
        ]
    }
    
    static func getFertileInfo() -> [CycleInfo] {
        return [CycleInfo(phaseDescription: "Esse é o momento em que você costuma sentir mais energia, confiança e extroversão. É importante aproveitar esse período para organizar e colocar em prática as atividades que são importantes para você.", phaseExpandedDescription: "Esse é o momento em que você costuma sentir mais energia, confiança e extroversão. É importante aproveitar esse período para organizar e colocar em prática as atividades que são importantes para você: uma reunião indispensável, um compromisso em que você precise se locomover ou aquela conversa mais difícil com uma pessoa próxima. É um boa oportunidade de aumentar o foco e progredir em seus exercícios e atividades físicas: progressão de carga, treinos de força máxima e treinos metabólicos são bem vindos. Use esse tempo para praticar seus hobbies e atividades que te entretenham. Por ser um momento de alta fertilidade, lembre-se dos métodos contraceptivos!", phaseName: "Período fértil")
        ]
    }
    
    static func getLuthealInfo() -> [CycleInfo] {
        return [CycleInfo(phaseDescription: "Sua mente pode começar a ficar lenta em comparação às semanas anteriores. É possível que você comece a notar uma queda significativa na sua produtividade. Síndrome Pré Menstrual, conhecida por TPM, também pode aparecer nos dias dessa fase do ciclo. Use sua sensibilidade a seu favor: bom momento para atividades de autorreflexão e organização pessoal.", phaseExpandedDescription: "Sua mente pode começar a ficar lenta em comparação às semanas anteriores. É possível que você comece a notar uma queda significativa na sua produtividade. Síndrome Pré Menstrual, conhecida por TPM, também pode aparecer nos dias dessa fase do ciclo. Use sua sensibilidade a seu favor: bom momento para atividades de autorreflexão e organização pessoal: da casa, do quarto, da agenda. É aconselhável evitar compromissos sociais intensos nos momentos que se aproximam da sua menstruação, já que suas emoções podem estar mais afloradas. Bom momento também para colocar as atividades de lazer em dia: atualize-se nas suas séries e assista a seus filmes preferidos. No que diz respeito a atividades físicas, é recomendado começar a dosar a intensidade, focar em mobilidade, alongamentos, trabalhar mais o core e focar em exercícios de menor impacto.", phaseName: "Fase luteal")
        ]
    }
}



