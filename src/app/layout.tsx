// app/layout.tsx
import { NavigationBar } from "@/components/navigation-bar";
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Kraut Rüben | Bio-Lebensmittel & Rezepte",
  description: "Ihr Online-Shop für Bio-Lebensmittel und nachhaltige Rezepte",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="de">
      <body className={`${geistSans.variable} ${geistMono.variable} font-sans antialiased`}>
        <div className="min-h-screen bg-gray-50">
          <NavigationBar />
          <main className="container mx-auto px-4 py-8">
            {children}
          </main>
          <footer className="border-t bg-white">
            <div className="container mx-auto px-4 py-6 text-center text-sm text-gray-600">
              © {new Date().getFullYear()} Kraut Rüben. Alle Rechte vorbehalten.
            </div>
          </footer>
        </div>
      </body>
    </html>
  );
}