// Example: Multi-dimensional paper review workflow
// This is a Claude Code workflow script (used with the Workflow tool)
// It fans out review agents across multiple dimensions, then synthesizes

export const meta = {
  name: 'review-paper',
  description: 'Multi-agent paper review across quality dimensions',
  phases: [
    { title: 'Review', detail: 'Parallel review from multiple dimensions' },
    { title: 'Synthesize', detail: 'Merge findings into final review' },
  ],
}

const PAPER_CONTEXT = args?.paper || 'Read the paper abstract from abstract.txt in the current directory'

const DIMENSIONS = [
  {
    key: 'novelty',
    prompt: `You are a reviewer focused on NOVELTY. ${PAPER_CONTEXT}
    Evaluate: Is this work truly novel? What prior work does it build on?
    Is the contribution incremental or significant? Rate novelty 1-10 with justification.`
  },
  {
    key: 'methodology',
    prompt: `You are a reviewer focused on METHODOLOGY. ${PAPER_CONTEXT}
    Evaluate: Is the experimental design sound? Are baselines appropriate?
    Are there confounding variables? Is the evaluation sufficient? Rate rigor 1-10.`
  },
  {
    key: 'impact',
    prompt: `You are a reviewer focused on IMPACT and SIGNIFICANCE. ${PAPER_CONTEXT}
    Evaluate: Who benefits from this work? How broadly applicable is it?
    Does it open new research directions? Rate impact 1-10.`
  },
  {
    key: 'clarity',
    prompt: `You are a reviewer focused on CLARITY and PRESENTATION. ${PAPER_CONTEXT}
    Evaluate: Is the writing clear? Are figures informative? Is the paper well-organized?
    Can a graduate student in the field follow it? Rate clarity 1-10.`
  }
]

const REVIEW_SCHEMA = {
  type: 'object',
  properties: {
    dimension: { type: 'string' },
    score: { type: 'number', minimum: 1, maximum: 10 },
    strengths: { type: 'array', items: { type: 'string' } },
    weaknesses: { type: 'array', items: { type: 'string' } },
    justification: { type: 'string' },
  },
  required: ['dimension', 'score', 'strengths', 'weaknesses', 'justification']
}

// Phase 1: Fan out parallel reviews
phase('Review')
log('Starting parallel review across 4 dimensions...')

const reviews = await parallel(
  DIMENSIONS.map(d => () =>
    agent(d.prompt, {
      label: `review:${d.key}`,
      phase: 'Review',
      schema: REVIEW_SCHEMA
    })
  )
)

const validReviews = reviews.filter(Boolean)
log(`Completed ${validReviews.length}/${DIMENSIONS.length} reviews`)

// Phase 2: Synthesize
phase('Synthesize')

const synthesisPrompt = `You are a meta-reviewer. Here are reviews from ${validReviews.length} dimensions:

${JSON.stringify(validReviews, null, 2)}

Synthesize into a final review:
1. Overall recommendation (Strong Accept / Accept / Borderline / Reject / Strong Reject)
2. Key strengths (top 3)
3. Key weaknesses (top 3)
4. Questions for authors
5. Suggestions for improvement`

const synthesis = await agent(synthesisPrompt, {
  label: 'synthesize',
  phase: 'Synthesize'
})

return {
  reviews: validReviews,
  synthesis
}
