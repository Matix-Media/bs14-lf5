import { query } from '@/lib/db';

export async function GET() {
    try {
        const result = await query(`
      SELECT
        r.rezeptnr,
        r.name,
        r.beschreibung,
        r.portionen,
        r.schwierigkeitsgrad,
        r.zubereitungszeit,
        json_agg(
          json_build_object(
            'bezeichnung', z.bezeichnung,
            'menge', rz.menge,
            'einheit', rz.einheit
          )
        ) as zutaten
      FROM rezept r
      LEFT JOIN rezeptzutat rz ON r.rezeptnr = rz.rezeptnr
      LEFT JOIN zutat z ON rz.zutatennr = z.zutatennr
      WHERE r.name = $1
      GROUP BY r.rezeptnr
    `, ["Lachslasagne"]);

        let queryresult  =  result.rows[0] || null;
        console.log('queryresult:', queryresult);
        return Response.json(queryresult);
    } catch (error) {
        console.error('Error fetching recipe:', error);
        return Response.json({ error: 'Failed to fetch recipe' }, { status: 500 });

    }

}
